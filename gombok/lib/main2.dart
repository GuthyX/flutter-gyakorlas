import 'package:flutter/material.dart';
import 'package:gombok/CustomObjects/CustomFormatter.dart';
import 'package:gombok/pages/MainScreen.dart';
import 'package:gombok/pages/PurchaseScreen.dart';
import 'package:gombok/res/String.dart' as string;

void main() {
  CustomFormatter.initializeLocale();
  runApp(const MyApp());
}

class CustomDateHandler {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
      routes: {
        string.homePage: (context) => const MainScreen(),
        string.purchaseScreen: (context) => const PurchaseScreen()
      },
    );
  }
}
