import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// a seat class that takes in 3 arguments
/// button text, bool changebutton color and the width of the  button
class Seat extends StatefulWidget {
  final String buttonText;
  bool changeButtonColor;
  final double width;
  Color disabledColor;
  Seat(this.buttonText, this.changeButtonColor, this.width,
      {this.disabledColor});

  @override
  MySeatState createState() => MySeatState();
}

class MySeatState extends State<Seat> {
  // function that returns seat button widget
  Widget _seat() {
    Color _mycolor = Color.fromRGBO(150, 150, 150, 1);
    return Container(
      width: widget.width,
      margin: EdgeInsets.only(left: 3.0, right: 3.0, bottom: 3.0),
      child: MaterialButton(
        color: widget.disabledColor != null
            ? widget.disabledColor
            : widget.changeButtonColor
                ? Color.fromRGBO(48, 119, 1, 1)
                : _mycolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
        child: new Text(
          widget.buttonText,
          style: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        onPressed: () {
          if (widget.disabledColor != null) {
            Fluttertoast.showToast(
                msg: 'Seat is already booked!',
                toastLength: Toast.LENGTH_SHORT,
                backgroundColor: Colors.red,
                gravity: ToastGravity.BOTTOM);
          } else {
            setState(() {
              widget.changeButtonColor = !widget.changeButtonColor;
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _seat();
  }
}
