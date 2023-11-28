import 'package:flutter/material.dart';
import '../res/style.dart' as style;

class DatePicker extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  final Function()? onBackPressed;
  final Function()? onFowardPressed;

  const DatePicker(this.selectedDate, this.onDateSelected, this.onBackPressed,
      this.onFowardPressed,
      {super.key});

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final List<String> months = [
    'Január',
    'Február',
    'Március',
    'Április',
    'Május',
    'Június',
    'Július',
    'Augusztus',
    'Szeptember',
    'Október',
    'November',
    'December',
  ];

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
                '${widget.selectedDate.year}. ${months[widget.selectedDate.month - 1]}',
                style: const TextStyle(fontSize: 18),
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
            onPressed: widget.selectedDate.isBefore(DateTime.now())
                ? widget.onFowardPressed
                : null,
          ),
        ],
      ),
    );
  }
}
