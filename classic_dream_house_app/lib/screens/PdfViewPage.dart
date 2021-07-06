import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
class PdfViewPage extends StatefulWidget {
  final PDFDocument pdfDocument;
  PdfViewPage({this.pdfDocument});
  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  PDFDocument document;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PDFViewer(document: widget.pdfDocument,zoomSteps: 1, ),
    );
  }
}