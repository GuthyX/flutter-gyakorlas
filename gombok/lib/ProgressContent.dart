import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressContent extends StatelessWidget {
  final String text;
  final bool isLoading;
  final Color color;

  const ProgressContent(
      {super.key,
      this.color = Colors.red,
      required this.text,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
        if (isLoading)
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: SizedBox(
              width: 15,
              height: 15,
              child: CupertinoActivityIndicator(
                color: color,
              ),
            ),
          )
      ],
    );
  }
}
