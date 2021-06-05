import 'package:flutter/material.dart';

import '../theme.dart';

class MainButtonType extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClick;
  final Key btnKey;
  MainButtonType({ this.buttonText, this.onClick, this.btnKey});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: btnKey,
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
