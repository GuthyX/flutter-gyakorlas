import 'package:flutter/material.dart';
import 'package:gombok/Button.dart';
import 'package:gombok/String.dart' as string;

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Stack(
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('button 1 : $isLoading1'),
                  Text('button 2 : $isLoading2'),
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
                          isProgressShow: true,
                          isDisable: true,
                          height: 50,
                          buttonText: string.textButtonPrimary,
                          buttonType: ButtonType.primary,
                          onPressed: () {}),
                      const SizedBox(
                        height: 15,
                      ),
                      Button(
                        isDisable: false,
                        height: 50,
                        buttonText: string.textButtonSecondary,
                        buttonType: ButtonType.secondary,
                        onPressed: () {},
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
