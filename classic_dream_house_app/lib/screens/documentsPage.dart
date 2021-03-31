import 'package:classic_dream_house_app/widgets/pdfCard.dart';
import 'package:flutter/material.dart';

class DocumentsPage extends StatefulWidget {
  @override
  _DocumentsPageState createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          runSpacing: 16,
          children: [
              PdfCard(),
              PdfCard(),
              PdfCard(),
              PdfCard(),
          ],
        ),
      ),
    );
  }
}
