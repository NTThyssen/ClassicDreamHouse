import 'dart:html';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:classic_dream_house_web/Widgets/documentUploadWidget.dart';
import 'package:path/path.dart' as p;

import 'package:classic_cream_couse/Model/buildingProject.dart';
import 'package:classic_cream_couse/Model/customer.dart';
import 'package:classic_dream_house_web/Screens/homeScreen.dart';
import 'package:classic_dream_house_web/Services/database.dart';
import 'package:classic_dream_house_web/Widgets/menuTopBar.dart';
import 'package:classic_dream_house_web/Widgets/timelineInputWidget.dart';
import 'package:classic_dream_house_web/mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:classic_cream_couse/shared_widgets/inputField.dart';
import 'package:classic_cream_couse/theme.dart';
import 'package:classic_cream_couse/shared_widgets/mainButtonType.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:path/path.dart' as path;
class CreateProjectPage extends StatefulWidget {
  static const String route = '/createProject';

  @override
  _CreateProjectPageState createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> with BasicMixin{

  List<dynamic> timelineElements = [];

  addToTimeline(Widget widget){
    timelineElements.length == 0 ? timelineElements.add(widget) : timelineElements.insert(timelineElements.length-1 , Center(child: widget));

  }

 TextEditingController textEditingController1 = TextEditingController();
 TextEditingController textEditingController2 = TextEditingController();
 TextEditingController textEditingController3 = TextEditingController();
 TextEditingController textEditingController4 = TextEditingController();
 TextEditingController textEditingController5 = TextEditingController();
 TextEditingController textEditingController6 = TextEditingController();
 final _formKey = GlobalKey<FormState>();
 @override
  Widget appBar() {
    return AppBar(
      leading: IconButton(icon: Icon(Icons.arrow_back), color: appTheme.backgroundColor, onPressed: (){Navigator.pop(context);},) ,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timelineElements.add( Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IconButton(
          icon: Icon(Icons.add_circle, color: appTheme.primaryColor, size: 40,),
          onPressed: () {
            textEditingController6.text="";
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Positioned(
                          right: -40.0,
                          top: -40.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: InputField(labelText: "Category",controller: textEditingController6,),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MainButtonType(buttonText:"Tilføj til tidslinje",
                                    onClick: () {

                                      setState(() {
                                        addToTimeline( TimelineInputWidget(title: textEditingController6.text,notStarted: true, isActive: false, isComplete: false,));
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    ),
    );
 }


  fb.UploadTask _uploadTask;
//method to load image and update `uploadedImage`
  uploadPDFToFirebase(File pdf) async {
    final filePath = 'pdf/${p.basename(pdf.name)}';
    setState(()  {
      _uploadTask = fb
          .storage()
          .refFromURL("gs://classic-dream-house.appspot.com")
          .child(filePath)
          .put(pdf);
    });
  }
  uploadImageToFirebase(File imageFile) async {
    final filePath = 'images/${p.basename(imageFile.name)}';
    setState(()  {
      _uploadTask = fb
          .storage()
          .refFromURL("gs://classic-dream-house.appspot.com")
          .child(filePath)
          .put(imageFile);
    });
  }

  /// A "select file/folder" window will appear. User will have to choose a file.
  /// This file will be then read, and uploaded to firebase storage;
  uploadImage() async {
    // HTML input element
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen(
            (changeEvent) {
          final file = uploadInput.files.first;
          final reader = FileReader();
          // The FileReader object lets web applications asynchronously read the
          // contents of files (or raw data buffers) stored on the user's computer,
          // using File or Blob objects to specify the file or data to read.
          // Source: https://developer.mozilla.org/en-US/docs/Web/API/FileReader

          reader.readAsDataUrl(file);
          // The readAsDataURL method is used to read the contents of the specified Blob or File.
          //  When the read operation is finished, the readyState becomes DONE, and the loadend is
          // triggered. At that time, the result attribute contains the data as a data: URL representing
          // the file's data as a base64 encoded string.
          // Source: https://developer.mozilla.org/en-US/docs/Web/API/FileReader/readAsDataURL

          reader.onLoadEnd.listen(
            // After file finiesh reading and loading, it will be uploaded to firebase storage
                (loadEndEvent) async {
              await uploadPDFToFirebase(file);
            },
          );
        });
        }


  @override
  Widget body() {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              SizedBox(height: 50,),
              MenuTopBar(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Center(child: Text("Tilføj Elementer til tidslinje", style: headerTextStyle.copyWith(color: appTheme.primaryColor),)),
                          Expanded(
                            child: ListView.builder(
                              itemCount: timelineElements.length,
                              itemBuilder: (_, index) => timelineElements[index]
                            ),
                          ),

                          SizedBox(height: 60,)

                        ],
                      ),
                    ),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () async {
                               await uploadImage();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: appTheme.primaryColor),
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              height: 300,
                              width: 300,
                              child: Icon(Icons.image, color: appTheme.primaryColor, size: 80,),
                            ),
                          ),
                          InputField(controller: textEditingController2, labelText: "Mobil",),
                          InputField(controller: textEditingController3, labelText: "email",),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(appTheme.primaryColor),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    )
                                )
                            ),
                            child: Text("Opret Bygge Projekt", style: headerTextStyle,),
                            onPressed: () {
                             DatabaseService().createProject(
                                 BuildingProject(customer:Customer(textEditingController1.text, textEditingController2.text, textEditingController3.text), )
                             );
                            },
                          ),
                        ],),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
                        child: Column(
                          children: [
                            DocumentUploadWidget()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
/*Future uploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('eventPicture/${path.basename(image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(File(image.path));

    await uploadTask.onComplete;
    print('File Uploaded');

    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
      });
    });
  }
  PickedFile image;
  cameraConnect() async {
    print('Picker is Called');
    if (image == null) {
      PickedFile img =
      await ImagePicker().getImage(source: ImageSource.camera);
      if (img != null) {
        image = img;
        setState(
              () {
            uploadFile();
          },
        );
      }
    }
  }*/


}

  @override
  Widget body() {
    // TODO: implement body
    throw UnimplementedError();
  }
