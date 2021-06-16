import 'package:flutter/material.dart';

import '../theme.dart';

class MainButtonType extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClick;
  final Key btnKey;
  final Color color;
  MainButtonType({ this.buttonText, this.onClick, this.btnKey, this.color});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: btnKey,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color ?? appTheme.primaryColor),
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
