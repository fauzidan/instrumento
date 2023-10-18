import 'package:flutter/material.dart';
import 'package:instrumento/presentation/catalog/pages/catalog_page.dart';
import 'package:instrumento/utils/web_scroll_behavior.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instrumento',
      scrollBehavior: WebScrollBehavior(),
      theme: ThemeData(
        fontFamily: 'Montserrat',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black87,
        ),
      ),
      home: const CatalogPage(),
    );
  }
}
