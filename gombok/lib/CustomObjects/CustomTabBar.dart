import 'package:flutter/material.dart';
import 'package:gombok/res/Color.dart' as CustomColor;
import 'package:gombok/res/style.dart' as style;

class CustomTabBar extends StatefulWidget {
  final List<String> tabList;
  const CustomTabBar({super.key, required this.tabList});

  @override
  _CustomTabBar createState() => _CustomTabBar();
}

class _CustomTabBar extends State<CustomTabBar> {
  var current = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double changeContainerWidth() {
      switch (current) {
        case 0:
          return size.width / widget.tabList.length;
        case 1:
          return size.width / widget.tabList.length;
        case 2:
          return size.width / widget.tabList.length;
        default:
          return 0;
      }
    }

    double changePositionLine() {
      switch (current) {
        case 0:
          return 0;
        case 1:
          return (size.width / widget.tabList.length);
        case 2:
          return (size.width / widget.tabList.length) * 2;
        default:
          return 0;
      }
    }

    double changePositionTabs(int i) {
      switch (i) {
        case 0:
          return 44;
        case 1:
          return 90;
        case 2:
          return 90;
        default:
          return 0;
      }
    }

    return SizedBox(
        width: size.width,
        height: size.height - 150,
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.05,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      width: size.width,
                      height: size.height * 0.04,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.tabList.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  debugPrint('Presssed menu $current');
                                  debugPrint('Presssed menu index  $index');
                                  current = index;
                                },
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: changePositionTabs(index),
                                top: 7,
                              ),
                              child: Center(
                                child: Text(
                                  widget.tabList[index],
                                  style: style.textStylePrimary.copyWith(
                                    color: current == index
                                        ? CustomColor.colorPrimary
                                        : CustomColor.enable,
                                    fontSize: current == index ? 16 : 14,
                                    fontWeight: current == index
                                        ? FontWeight.w400
                                        : FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    bottom: 0,
                    width: changeContainerWidth(),
                    duration: const Duration(milliseconds: 500),
                    left: changePositionLine(),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: AnimatedContainer(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      duration: const Duration(microseconds: 500),
                      width: changeContainerWidth(),
                      height: size.height * 0.008,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10), bottom: Radius.zero),
                        color: CustomColor.colorPrimary,
                      ),
                    ),
                  ),
                  Positioned(
                      width: size.width,
                      height: 0.5,
                      bottom: 0,
                      left: 0,
                      child: Divider(
                        height: 0.5,
                        color: CustomColor.enable,
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
