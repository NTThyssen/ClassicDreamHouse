import 'package:classic_cream_couse/Model/buildingProject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  final CollectionReference projectCollection = FirebaseFirestore.instance.collection("projects");


  Future createProject(BuildingProject buildingProject) async {

    return await projectCollection.doc(uid).set(
        buildingProject.toJson()
    );

  }

  Stream<QuerySnapshot> get getProjects  {
    return  projectCollection.snapshots();

  }


  Future updateProject(BuildingProject buildingProject) async {

    return await projectCollection.doc(uid).update(
        buildingProject.toJson()
    );

  }

}