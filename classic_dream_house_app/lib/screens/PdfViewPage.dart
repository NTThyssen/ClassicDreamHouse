import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
class PdfViewPage extends StatefulWidget {
  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  PDFDocument document;
  bool _isLoading = true;
  loadDocument() async {
    document = await PDFDocument.fromAsset('images/sample.pdf');
    setState(() => _isLoading = false);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDocument();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isLoading ? CircularProgressIndicator() : PDFViewer(document: document,zoomSteps: 1,),
    );
  }
}
