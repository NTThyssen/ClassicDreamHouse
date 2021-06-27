
import 'package:flutter/material.dart';
import 'package:classic_cream_couse/theme.dart';
import 'package:classic_cream_couse/shared_widgets/mainButtonType.dart';
class DocumentUploadWidget extends StatefulWidget {
  final String text;
  DocumentUploadWidget({this.text});
  @override
  _DocumentUploadWidgetState createState() => _DocumentUploadWidgetState();
}

class _DocumentUploadWidgetState extends State<DocumentUploadWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.text ?? "" + "-----------------------");
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: new TextFormField(
              enabled: false,
              decoration: new InputDecoration(
                  hintText: (widget.text == null || widget.text != "") ?  "Upload Dokument" :widget.text ,
                  labelStyle: new TextStyle(
                      color: appTheme.primaryColor
                  )
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Icon(Icons.picture_as_pdf, color: appTheme.primaryColor, size: 40,))
        ],
      ),);
  }
}
