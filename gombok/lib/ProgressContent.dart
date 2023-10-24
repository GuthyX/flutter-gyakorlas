import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'style.dart' as style;

class ProgressContent extends StatelessWidget {
  final String text;
  final bool isLoading;
  final Color color;
  final bool isShowProgress;

  const ProgressContent(
      {super.key,
      this.color = Colors.red,
      this.isShowProgress = false,
      required this.text,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: style.textStylePrimary,
          ),
        ),
        if (isLoading && isShowProgress)
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                width: 15,
                height: 15,
                child: CupertinoActivityIndicator(
                  color: color,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
