import 'package:block/bussiness_logic/cubit/chracters_cubit.dart';
import 'package:block/data/models/chracters.dart';
import 'package:block/data/repo/chracters_repo.dart';
import 'package:block/data/web_services/chracters_webServices.dart';
import 'package:block/peresention/screens/chracter_screen_details.dart';
import 'package:block/peresention/screens/chracters_screen.dart';
import 'package:block/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepo chracterRepostery;
  late ChractersCubit chracterCubit;
  AppRouter() {
    chracterRepostery = CharactersRepo(webServices: CharactersWebServices());
    chracterCubit = ChractersCubit(chracterRepostery);
  }
  Route? ggenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case chractersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => chracterCubit,
            child: ChractersScreen(),
          ),
        );
      case chractersScreenDetails:
        final chracter = settings.arguments as Result;
        return MaterialPageRoute(
            builder: (_) => ChracterScreenDeatils(
                  chracter: chracter,
                ));
    }
    return null;
  }
}
