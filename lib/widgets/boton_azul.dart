import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const BotonAzul({this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        elevation: 2,
        highlightElevation: 5,
        color: Colors.blue,
        shape: StadiumBorder(),
        child: Container(
            width: double.infinity,
            child: Center(
              child: Text(this.text,
                  style: TextStyle(
                    color: Colors.white,
                  )),
            )),
        onPressed: this.onPressed);
  }
}
