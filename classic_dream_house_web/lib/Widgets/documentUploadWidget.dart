
import 'package:flutter/material.dart';
import 'package:classic_cream_couse/theme.dart';
import 'package:classic_cream_couse/shared_widgets/mainButtonType.dart';
class DocumentUploadWidget extends StatefulWidget {
  @override
  _DocumentUploadWidgetState createState() => _DocumentUploadWidgetState();
}

class _DocumentUploadWidgetState extends State<DocumentUploadWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: new TextField(
                enabled: false,
                decoration: new InputDecoration(
                    hintText: "Upload Dokument",
                    labelStyle: new TextStyle(
                        color: appTheme.primaryColor
                    )
                ),

              ),
            ),
            Expanded(child: MainButtonType(buttonText: "Upload Dokument",))

          ],

      ),),
    );
  }
}
