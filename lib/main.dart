import 'package:flutter/material.dart';
import 'package:flutter_challenge_rick_morty/core/pages/details_page.dart';
import 'package:flutter_challenge_rick_morty/core/pages/list_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => ListPage(),
            );
          case '/details':
            int id = settings.arguments as int;
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => DetailsPage(id: id),
            );
          default:
            return null;
        }
      },
    );
  }
}
