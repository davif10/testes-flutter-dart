import 'package:favorites/screens/favorites.dart';
import 'package:favorites/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'models/favorites.dart';

void main() async {
  runApp(const TestingApp());
}

final _router = GoRouter(routes: [
  GoRoute(
      path: HomePage.routeName,
      builder: (context, state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
            path: FavoritesPage.routeName,
            builder: (context, state) {
              return const FavoritesPage();
            })
      ])
]);

class TestingApp extends StatelessWidget {
  const TestingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp.router(
        title: 'Testing Sample',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        routerConfig: _router,
      ),
    );
  }
}