import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_flutter/models/books.dart';
import 'package:ui_flutter/models/category.dart';
import 'package:ui_flutter/views/choose_category/choose_category_provider.dart';
import 'package:ui_flutter/views/splash_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: ((context) => ChooseCategoryProvider()),
      ),
      ChangeNotifierProvider(
        create: ((context) => BookProvider()),
      ),
      ChangeNotifierProvider(
        create: ((context) => Category(name: '', svgPicture: '')),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: const SplashScreen());
  }
}
