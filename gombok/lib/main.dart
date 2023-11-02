import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gombok/Button.dart';
import 'package:gombok/DatePicker.dart';
import 'package:gombok/String.dart' as string;
import 'DatePicker.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading1 = false;
  bool isLoading2 = false;
  DateTime currentDate = DateTime(2020, 07);
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Stack(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                DatePicker(
                  currentDate,
                  (currentDate) => null,
                  () => {
                    setState(() {
                      currentDate =
                          DateTime(currentDate.year, currentDate.month - 1);
                    }),
                  },
                  () => {
                    setState(() {
                      currentDate =
                          DateTime(currentDate.year, currentDate.month + 1);
                    }),
                  },
                ),
              ],
            ),
            SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('button 1 : $isLoading1'),
                  Text('button 2 : $isLoading2'),
                  Text(
                      'Selected Date : ${selectedDate?.year} ${DateFormat('MMMM').format(selectedDate)}'),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Align(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Button(
                        height: 50,
                        buttonText: string.textButtonPrimary,
                        isProgress: isLoading1,
                        onProgress: (isProgress) {
                          debugPrint('Button1: $isProgress');
                          isProgress = !isProgress;
                        },
                        buttonType: ButtonType.primary,
                        onPressed: () {
                          setState(() {
                            isLoading1 = !isLoading1;
                          });
                          Timer(Duration(seconds: 3), () {
                            setState(() {
                              isLoading1 = !isLoading1;
                            });
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Button(
                        height: 50,
                        isProgress: isLoading2,
                        onProgress: (isProgress) {
                          debugPrint('Button2: $isProgress');
                        },
                        buttonText: string.textButtonSecondary,
                        buttonType: ButtonType.secondary,
                        onPressed: () {
                          setState(() {
                            isLoading2 = !isLoading2;
                            selectedDate = currentDate;
                          });
                          Timer(Duration(seconds: 3), () {
                            setState(() {
                              isLoading2 = !isLoading2;
                            });
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }

  /* double calculateButtonHeight(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    return renderBox.size.height;
  } */
}
