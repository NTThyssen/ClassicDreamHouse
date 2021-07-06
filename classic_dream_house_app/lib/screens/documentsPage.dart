import 'package:classic_cream_couse/Model/buildingProject.dart';
import 'package:classic_dream_house_app/services/database.dart';
import 'package:classic_dream_house_app/widgets/pdfCard.dart';
import 'package:flutter/material.dart';

class DocumentsPage extends StatefulWidget {
  final String uuid;
  DocumentsPage({this.uuid});
  @override
  _DocumentsPageState createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BuildingProject>(
      stream: DatabaseService().projectStream(widget.uuid),
      builder: (context, snapshot) {
        return snapshot.hasData ? Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
            itemCount: snapshot.data.documents.length,
            itemBuilder: (BuildContext ctx, index) {
              return PdfCard(pdfTitle: snapshot.data.documents[index].title, uri: snapshot.data.documents[index].uri, );
              }
            )
          )
        ) : Center(child: Container(child: Text("Der er ingen dokumenter"),),);
      }
    );
  }
}
