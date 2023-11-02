import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'style.dart' as style;

class DatePicker extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  final Function()? onBackPressed;
  final Function()? onFowardPressed;

  DatePicker(this.selectedDate, this.onDateSelected, this.onBackPressed,
      this.onFowardPressed);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
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
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15.0),
              child: Text(
                '${widget.selectedDate.year}. ${DateFormat('MMMM').format(widget.selectedDate)}',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          IconButton(
            style: widget.selectedDate.isBefore(DateTime.now())
                ? style.roundButton
                : style.disableRoundButton,
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: widget.selectedDate.isBefore(DateTime.now())
                ? widget.onFowardPressed
                : null,
          ),
        ],
      ),
    );
  }
}
