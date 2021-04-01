import 'package:flutter/material.dart';
import '../theme.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  InputField(this.controller);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  textListener(){
    print(widget.controller.text);
  }

  @override
  void initState() {
    widget.controller.addListener(() {textListener();});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.15,
      color: appTheme.backgroundColor,
      child: TextFormField(
        controller: widget.controller,
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
