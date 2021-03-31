import 'package:flutter/material.dart';
import '../theme.dart';

class InputField extends StatefulWidget {
  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.15,
      color: appTheme.backgroundColor,
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.greenAccent, width: 2)),
            enabled: true,
            border: OutlineInputBorder(),
            labelText: "Bruger-ID",
            labelStyle: bodyTextStyle.copyWith(fontSize: 18)
        ),
      ),
    );
  }
}
