import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gombok/ProgressContent.dart';
import 'style.dart' as primary_style;
import 'package:gombok/Color.dart' as color;

class Button extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final ButtonType buttonType;
  final double height;
  final bool isProgressShow;
  final bool isDisable;

  Button({
    Key? key,
    required this.isDisable,
    this.isProgressShow = false,
    required this.buttonText,
    required this.buttonType,
    required this.onPressed,
    required this.height,
  }) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isLoading = false;
  void onPressedWithCustomLogic() async {
    setState(() {
      isLoading = true;
    });

    widget.onPressed();

    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      debugPrint('Button1: In timmer');
      isLoading = false;
    });
    /* setState(() {
      isLoading = false;
    }); */
  }

  @override
  Widget build(BuildContext context) {
    double borderRadius = widget.height / 2.0;

    switch (widget.buttonType) {
      case ButtonType.primary:
        return SizedBox(
          height: widget.height,
          child: ElevatedButton(
            style: primary_style.buttonPrimary.copyWith(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
            onPressed: isLoading ? null : onPressedWithCustomLogic,
            child: ProgressContent(
              color: color.textcolorPrimary,
              isLoading: isLoading,
              isShowProgress: widget.isProgressShow,
              text: widget.buttonText,
            ),
          ),
        );
      default:
        return SizedBox(
          height: widget.height,
          child: ElevatedButton(
            style: primary_style.buttonSecondary.copyWith(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
            onPressed:
                widget.isDisable || isLoading ? null : onPressedWithCustomLogic,
            child: Text(
              widget.buttonText,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        );
    }
  }
}

enum ButtonType {
  primary,
  secondary,
}
