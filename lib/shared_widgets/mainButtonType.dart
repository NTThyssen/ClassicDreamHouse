import 'package:flutter/material.dart';

import '../theme.dart';

class MainButtonType extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClick;
  MainButtonType({ this.buttonText, this.onClick});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(appTheme.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              )
          )
      ),
      onPressed: () => onClick(),
      child: Text(buttonText, style: headerTextStyle,),
    );
  }
}
