import 'package:block/app_router.dart/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(RickAndMorty(
    appRouter: AppRouter(),
  ));
}

class RickAndMorty extends StatelessWidget {
  final AppRouter appRouter;

  const RickAndMorty({super.key, required this.appRouter});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.ggenerateRoute,
    );
  }
}
