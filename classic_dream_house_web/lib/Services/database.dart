import 'package:classic_cream_couse/Model/buildingProject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:classic_cream_couse/Model/buildingProject.dart';
class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  final CollectionReference projectCollection = FirebaseFirestore.instance.collection("projects");


  Future createProject(BuildingProject buildingProject) async {

    return await projectCollection.doc(uid).set(
        buildingProject.toJson()
    );

  }




  List<BuildingProject> _projectListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return BuildingProject.fromJson(doc.data());}).toList();
  }

  Stream<List<BuildingProject>> get getProjects  {
    return  projectCollection.snapshots().map(_projectListFromSnapshot);

  }


  

  Future updateProject(BuildingProject buildingProject) async {

    return await projectCollection.doc(uid).update(
        buildingProject.toJson()
    );

  }

}