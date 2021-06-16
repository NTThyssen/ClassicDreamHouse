import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:classic_cream_couse/theme.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:classic_dream_house_app/navigator/route_manager.dart' as router;
class PdfCard extends StatefulWidget {
  final String pdfTitle;
  PdfCard({this.pdfTitle});
  @override
  _PdfCardState createState() => _PdfCardState();
}

class _PdfCardState extends State<PdfCard> {
  PDFDocument document;
  bool _isLoading = true;
  DefaultCacheManager defaultCacheManager = new DefaultCacheManager();
  loadDocument() async {

    document =  await  PDFDocument.fromURL("https://www.clickdimensions.com/links/TestPDFfile.pdf",cacheManager: DefaultCacheManager());
   //document = await PDFDocument.fromAsset('images/sample.pdf');
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
    return _isLoading ? Container(child: CircularProgressIndicator(),) :
    GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, router.PdfViewRoute);

      },
      child: Container(
          height: 150,
          width: 150,
          child: Card(
              child: Column(
                children: [
                  Text(widget.pdfTitle, style: TextStyle(color: appTheme.primaryColor),),
                  Expanded(child: PDFViewer(document: document, zoomSteps: -1, showPicker: false, showIndicator: false, showNavigation: false, lazyLoad: true, ))
                ],
              )
          ),
        ),
    );
  }
}

