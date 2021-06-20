import 'dart:html';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mime_type/mime_type.dart';
import 'package:universal_html/src/html.dart' as html;
import 'package:cool_alert/cool_alert.dart';
import 'package:classic_dream_house_web/Widgets/documentUploadWidget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;
import 'package:classic_cream_couse/Model/buildingProject.dart';
import 'package:classic_cream_couse/Model/customer.dart';
import 'package:classic_dream_house_web/Services/database.dart';
import 'package:classic_dream_house_web/Widgets/timelineInputWidget.dart';
import 'package:classic_dream_house_web/mixin.dart';
import 'package:flutter/material.dart';
import 'package:classic_cream_couse/shared_widgets/inputField.dart';
import 'package:classic_cream_couse/theme.dart';
import 'package:classic_cream_couse/shared_widgets/mainButtonType.dart';
import 'package:classic_cream_couse/Model/status.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:classic_cream_couse/Model/timelineData.dart';
import 'package:path/path.dart' as path;

class CreateProjectPage extends StatefulWidget {
  static const String route = '/createProject';
  BuildingProject buildingProject;
  CreateProjectPage({this.buildingProject});
  @override
  _CreateProjectPageState createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> with BasicMixin{

  List<dynamic> timelineElements = [];
  List<TimelineData> timelineDataList = [];
  addToTimeline(Widget widget){
    timelineElements.length == 0 ? timelineElements.add(widget) : timelineElements.insert(timelineElements.length , Center(child: widget));

  }

 TextEditingController nameController= TextEditingController();
 TextEditingController partnerNameController = TextEditingController();
 TextEditingController mailController = TextEditingController();
 TextEditingController mobileController = TextEditingController();
 TextEditingController buildingAddressController = TextEditingController();
 TextEditingController livingAddressController = TextEditingController();
  TextEditingController timelineInitController = TextEditingController();
 final _formKey = GlobalKey<FormState>();
 void populateProject(BuildingProject buildingProject){
   nameController.text = buildingProject.customer.name;
   partnerNameController.text = buildingProject.customer.partnerName;
   mailController.text = buildingProject.customer.email;
   buildingAddressController.text = buildingProject.customer.buildingAddress;
   livingAddressController.text = buildingProject.customer.livingAddress;
   mobileController.text = buildingProject.customer.mobile;
   for(var elements in buildingProject.timeLineData){
     timelineDataList.add(elements);
     addToTimeline(TimelineInputWidget(timelineData: elements,));
   }
 }


  @override
  void initState() {
    super.initState();
    if(widget.buildingProject != null){
      populateProject(widget.buildingProject);
    }else{
      TimelineData temp = TimelineData(title: "Tilføj Titel", status: Status.notStarted);
      timelineDataList.add(temp);
      addToTimeline(TimelineInputWidget(timelineData: temp,));
      TimelineData temp2 = TimelineData(title: "Tilføj Titel", status: Status.notStarted);
      timelineDataList.add(temp2);
      TimelineData temp3 = TimelineData(title: "Tilføj Titel", status: Status.notStarted);
      timelineDataList.add(temp3);
      addToTimeline(TimelineInputWidget(timelineData: temp2,));
      addToTimeline(TimelineInputWidget(timelineData: temp3,));
    }

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
  Future<Uri> uploadImageFile(html.File file,
      {String imageName}) async {
    fb.StorageReference storageRef = fb.storage().ref('images/$imageName');
    fb.UploadTaskSnapshot uploadTaskSnapshot = await storageRef.putString(file.relativePath, 'base64').future;

    Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
    print(imageUri);
    return imageUri;
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
  @override
  Widget appBar() {
    return AppBar(
      title: Text("Classic Dream House", style: headerTextStyle.copyWith(fontSize: 26),),
      leading: IconButton(icon: Icon(Icons.arrow_back), color: appTheme.backgroundColor, onPressed: (){Navigator.pop(context);},) ,
      centerTitle: true,
    );
  }


  @override
  Widget body() {
    print(widget.buildingProject);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: ReorderableListView.builder(
                                  header: Center(child: Text("Tilføj Elementer til tidslinje", style: headerTextStyle.copyWith(color: appTheme.primaryColor),)),
                                    onReorder: (oldIndex, newIndex) {
                                      setState(() {
                                        if (newIndex > oldIndex) {
                                          newIndex = newIndex - 1;
                                        }
                                        final element = timelineElements.removeAt(oldIndex);
                                        timelineElements.insert(newIndex, element);
                                      });
                                    },
                                  itemCount: timelineElements.length,

                                  itemBuilder: (_, index) {
                                    return Container(
                                      key: ValueKey(timelineElements[index]),
                                      child:  timelineElements[index],
                                    );

                                  }
                                ),
                              ),

                              SizedBox(height: 60,)

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column (
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              var file = await FilePicker.platform.pickFiles(allowMultiple: true);
                              //print(file.);
                            // await uploadImageFile();

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: appTheme.primaryColor),
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              height: 300,
                              width: 300,
                              child: Hero(
                                tag: widget?.buildingProject?.projectuuId ?? "",
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      colorFilter: new ColorFilter.mode(Colors.transparent.withOpacity(1), BlendMode.dstATop),
                                      image: AssetImage("images/funkHouse.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            ),
                          ),
                        ],),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
                      child: Column(
                        children: [
                          DocumentUploadWidget(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Row(
                    children: [
                      Expanded(child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            child: IconButton(
                              key: Key("timelineBtn"),
                              icon: Icon(Icons.add_circle, color: appTheme.primaryColor, size: 80,),
                              onPressed: () {
                                timelineInitController.text="";
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
                                                    child: FractionallySizedBox(
                                                        child: InputField(inputKey: Key("inputTimeline"), labelText: "Category",controller: timelineInitController,)),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: MainButtonType(
                                                        btnKey: Key("addTimelineKey"),
                                                        buttonText:"Tilføj til tidslinje",
                                                        onClick: () {
                                                          setState(() {
                                                            TimelineData temp = TimelineData(title: timelineInitController.text, status: Status.notStarted);
                                                            timelineDataList.add(temp);
                                                            addToTimeline( TimelineInputWidget(timelineData: temp));
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
                        ],
                      )
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InputField(controller: nameController, labelText: "Navn"),
                            InputField(controller: partnerNameController, labelText: "Partner Navn",),
                            InputField(controller: mailController, labelText: "Email",),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InputField(controller: mobileController, labelText: "Mobil",),
                            InputField(controller: buildingAddressController, labelText: "Bygge Adresse",),
                            InputField(controller: livingAddressController, labelText: "Beboelses Adresse",),
                          ],
                        ),
                      )
                    ],
                )
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 300, height: 50),
                child: widget.buildingProject == null ? ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(appTheme.primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )
                      )
                  ),
                  child: Text("Opret Bygge Projekt", style: headerTextStyle,),
                  onPressed: () async {
                  var res = await DatabaseService().createProject(
                       BuildingProject(
                         timeLineData: timelineDataList,
                           customer: Customer(
                         name:nameController.text,
                         partnerName: partnerNameController.text,
                         email: mailController.text,
                         mobile: mobileController.text,
                         buildingAddress: buildingAddressController.text,
                         livingAddress: livingAddressController.text,)
                       ),
                    );
                  if(res == null){
                    await CoolAlert.show(
                      width: 400,
                      context: context,
                      autoCloseDuration: Duration(seconds: 2),
                      type: CoolAlertType.success,
                      text: "Projektet blev oprettet",
                    );
                    Navigator.pop(context);
                  }else{
                    await CoolAlert.show(
                      width: 400,
                      context: context,
                      autoCloseDuration: Duration(seconds: 2),
                      type: CoolAlertType.error,
                      text: "Projektet ikke oprettet",
                    );
                  }
                  },
                ) : ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(appTheme.primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )
                      )
                  ),
                  child: Text("Opdater Bygge Projekt", style: headerTextStyle,),
                  onPressed: () async{

                   var res = await DatabaseService().updateProject(
                      BuildingProject(
                          projectuuId: widget.buildingProject.projectuuId,
                          timeLineData: timelineDataList,
                          customer: Customer(
                            name:nameController.text,
                            partnerName: partnerNameController.text,
                            email: mailController.text,
                            mobile: mobileController.text,
                            buildingAddress: buildingAddressController.text,
                            livingAddress: livingAddressController.text,)
                      ),
                    );
                   if(res == null){
                     print("---------------");
                     await CoolAlert.show(
                       width: 400,
                       context: context,
                       autoCloseDuration: Duration(seconds: 2),
                       type: CoolAlertType.success,
                       text: "Projektet blev opdateret",
                     );
                      Navigator.pop(context);
                   }else{
                     await CoolAlert.show(
                       width: 400,
                       context: context,
                       autoCloseDuration: Duration(seconds: 2),
                       type: CoolAlertType.error,
                       text: "Projektet ikke opdateret",
                     );
                   }
                  },
                )
              ),
            ),
          ],
        ),
      ),
    ) ;

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
