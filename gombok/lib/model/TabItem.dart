import 'package:flutter/material.dart';

class TabItem {
  final Pages tab;
  final String title;
  final Widget widget;

  TabItem({required this.title, required this.tab, required this.widget});
}

enum Pages { all, parking, other, shop }
