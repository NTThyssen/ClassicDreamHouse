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
        child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20),
        itemCount: 4,
        itemBuilder: (BuildContext ctx, index) {
          return PdfCard(pdfTitle: "Kontrakt");
          }
        )
      )
    );
  }
}
