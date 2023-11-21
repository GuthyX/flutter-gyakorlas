import 'package:flutter/material.dart';
import '../res/style.dart' as style;
import 'CustomFormatter.dart';

class CustomDateSelector extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  final Function()? onBackPressed;
  final Function()? onFowardPressed;
  CustomDateSelector(this.selectedDate, this.onDateSelected, this.onBackPressed,
      this.onFowardPressed,
      {super.key});
  @override
  _CustomDateSelector createState() => _CustomDateSelector();
}

class _CustomDateSelector extends State<CustomDateSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            style: style.roundButton,
            icon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.arrow_back_ios),
            ),
            onPressed: widget.onBackPressed,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.0, color: Colors.grey), // 1px vastag szegély
                  borderRadius: BorderRadius.circular(10.0)),
              padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 15.0),
              child: Text(
                '${widget.selectedDate.year}. ${CustomFormatter.formatMonth(widget.selectedDate)}',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          IconButton(
            style: widget.selectedDate.isBefore(DateTime.now())
                ? style.roundButton
                : style.disableRoundButton,
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: widget.selectedDate.month != DateTime.now().month
                ? widget.onFowardPressed
                : null,
          ),
        ],
      ),
    );
  }
}
