import 'package:flutter/material.dart';
import 'package:gombok/ProgressContent.dart';
import '../res/style.dart' as primary_style;
import 'package:gombok/res/Color.dart' as color;

class Button extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final ButtonType buttonType;
  final double height;
  final bool isProgress;
  final bool isEnabled;
  final Function(bool)? onProgress;

  Button({
    Key? key,
    required this.buttonText,
    required this.buttonType,
    required this.onPressed,
    required this.height,
    this.isEnabled = true,
    this.isProgress = false,
    this.onProgress,
  }) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isLoading = false;
  @override
  void didUpdateWidget(covariant Button oldWidget) {
    _updateOnProgressCallback();
    super.didUpdateWidget(oldWidget);
  }

  void _updateOnProgressCallback() =>
      widget.onProgress != null ? widget.onProgress!(widget.isProgress) : null;
  void onPressedWithCustomLogic() async {
    widget.onPressed();
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
            onPressed: widget.isProgress ? null : onPressedWithCustomLogic,
            child: ProgressContent(
              color: color.textcolorPrimary,
              isLoading: widget.isProgress,
              isShowProgress: widget.isProgress,
              text: widget.buttonText,
            ),
          ),
        );
      default:
        return SizedBox(
          height: widget.height,
          child: ElevatedButton(
            style: widget.isProgress == false
                ? primary_style.buttonSecondary.copyWith(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                    ),
                  )
                : primary_style.disableButtonSecondary.copyWith(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                    ),
                  ),
            onPressed: widget.isProgress ? null : onPressedWithCustomLogic,
            child: ProgressContent(
              color: widget.isProgress == false
                  ? color.textcolorSecondary
                  : color.enable,
              isLoading: widget.isProgress,
              isShowProgress: widget.isProgress,
              text: widget.buttonText,
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
