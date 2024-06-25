import 'package:block/bussiness_logic/cubit/chracters_cubit.dart';
import 'package:block/constants/colors.dart';
import 'package:block/data/models/chracters.dart';
import 'package:block/peresention/widgets/chracters_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChractersScreen extends StatefulWidget {
  @override
  State<ChractersScreen> createState() => _ChractersScreenState();
}

class _ChractersScreenState extends State<ChractersScreen> {
  late List<Result> allCharacters;
  List<Result> filteredCharacters = [];
  bool isSearch = false;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChractersCubit>(context).getAllCharacters();
  }

  void _filterCharacters(String query) {
    final results = allCharacters.where((character) {
      final characterName = character.name!.toLowerCase().startsWith(query);
      final input = query.toLowerCase();
      return characterName;
    }).toList();

    setState(() {
      filteredCharacters = results;
    });
  }

  Widget buildBlocWidget() {
    return BlocBuilder<ChractersCubit, ChractersState>(
      builder: (context, state) {
        if (state is ChractersLoaded) {
          allCharacters = state.chracters;
          return buildLoadedListWidgets(allCharacters);
        } else {
          return showProgressIndicator();
        }
      },
    );
  }

  Widget showProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoadedListWidgets(List<Result> characters) {
    return SingleChildScrollView(
      child: Container(
        color: myColors.myYellow,
        child: Column(
          children: [
            buildCharactersList(characters),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList(List<Result> characters) {
    final displayedCharacters = isSearch ? filteredCharacters : characters;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: displayedCharacters.length,
      itemBuilder: (ctx, index) {
        return CharactersItem(
          res: displayedCharacters[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors.myYellow,
      appBar: AppBar(
        title: isSearch
            ? TextField(
                cursorColor: myColors.myYellow,
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: myColors.myYellow, fontSize: 20),
                  border: InputBorder.none,
                ),
                style: const TextStyle(color: Colors.black),
                onChanged: (query) {
                  _filterCharacters(query);
                },
              )
            : const Text(
                'Characters',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (isSearch) {
                  _searchController.clear();
                  filteredCharacters = allCharacters;
                  isSearch = false;
                } else {
                  isSearch = true;
                }
              });
            },
            icon: Icon(
              isSearch ? Icons.close : Icons.search,
              size: 35,
            ),
          ),
        ],
      ),
      body: buildBlocWidget(),
    );
  }
}
