import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gombok/CustomObjects/Button.dart';
import 'package:gombok/CustomObjects/CustomFormatter.dart';
import 'package:gombok/res/String.dart' as string;
import 'package:gombok/res/Color.dart' as color;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  bool isLoading1 = false;
  bool isLoading2 = false;
  DateTime currentDate = DateTime(2023, 02);
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            color.appBarBackgroundColor, // Set the background color
        elevation: 0, // Remove the shadow
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0), // Adjust the radius as needed
            bottomRight: Radius.circular(20.0), // Adjust the radius as needed
          ),
        ),
        title: const Text('Main screen'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('button 1 : $isLoading1'),
                Text('button 2 : $isLoading2'),
                Text(
                    'Selected Date : ${currentDate.year}. ${CustomFormatter.formatMonth(selectedDate)}'),
              ],
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Button(
                      height: 50,
                      buttonText: string.textButtonPrimary,
                      isProgress: isLoading1,
                      onProgress: (isProgress) {
                        //  isLoading1 = !isProgress;
                      },
                      buttonType: ButtonType.primary,
                      onPressed: () {
                        setState(() {
                          isLoading1 = true;
                        });
                        Timer(
                          const Duration(seconds: 5),
                          () => setState(() {
                            isLoading1 = false;
                            Navigator.pushNamed(context, string.purchaseScreen);
                          }),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Button(
                      height: 50,
                      buttonText: string.textButtonSecondary,
                      isProgress: isLoading2,
                      onProgress: (isProgress) {
                        //  isLoading2 = !isProgress;
                      },
                      buttonType: ButtonType.secondary,
                      onPressed: () {
                        setState(() {
                          isLoading2 = true;
                        });

                        Timer(
                          const Duration(seconds: 5),
                          () => setState(() {
                            isLoading2 = false;
                          }),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
