import 'package:bloc/bloc.dart';
import 'package:block/data/models/chracters.dart';
import 'package:block/data/repo/chracters_repo.dart';

import 'package:meta/meta.dart';

part 'chracters_state.dart';

class ChractersCubit extends Cubit<ChractersState> {
  final CharactersRepo charactersRepo;
  ChractersCubit(this.charactersRepo) : super(ChractersInitial());

  List<Result> allCharacters = [];

  Future<void> getAllCharacters() async {
    allCharacters = await charactersRepo.getAllCharacters();
    emit(ChractersLoaded(allCharacters));
  }
}
