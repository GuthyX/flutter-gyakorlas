import 'package:flutter/material.dart';
import 'package:gombok/res/Color.dart' as color;

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
    backgroundColor: color.colorPrimary,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(0)),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    foregroundColor: color.textcolorPrimary);

final ButtonStyle buttonSecondary = ElevatedButton.styleFrom(
    backgroundColor: color.colorSecondaty,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(0)),
    ),
    side: BorderSide(
      width: 2.0,
      color: color.colorPrimary,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    foregroundColor: color.textcolorSecondary);
final ButtonStyle disableButtonSecondary = ElevatedButton.styleFrom(
    backgroundColor: color.colorSecondaty,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(0)),
    ),
    side: BorderSide(
      width: 2.0,
      color: color.enable,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    foregroundColor: color.enable);

final ButtonStyle roundButton = ElevatedButton.styleFrom(
    elevation: 0,
    shape: const CircleBorder(),
    side: BorderSide(
      width: 1.0,
      color: color.colorPrimary,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    foregroundColor: color.textcolorSecondary);
final ButtonStyle disableRoundButton = ElevatedButton.styleFrom(
    elevation: 0,
    shape: CircleBorder(
      side: BorderSide(
        width: 1.0,
        color: color.enable,
      ),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    foregroundColor: color.textcolorSecondary);
final TextStyle textStylePrimary = TextStyle(
  color: color.textcolorPrimary,
);
final TextStyle textStyleSecondary = TextStyle(color: color.textcolorSecondary);
