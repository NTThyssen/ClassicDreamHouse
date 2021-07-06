import 'package:classic_cream_couse/Model/buildingProject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  final CollectionReference projectCollection = FirebaseFirestore.instance.collection("projects");
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");


  Future createUser() async {
    return await userCollection.doc(uid).update(
        //buildingProject.toJson()
    );

  }


  Stream<BuildingProject> projectStream(String doc){
    return projectCollection.doc(doc).snapshots().map((snap) {
      return BuildingProject.fromJson(snap.data()); });
  }

  Future<BuildingProject> getProject(String projectUuid) async {

   DocumentSnapshot doc = await projectCollection.doc(projectUuid).get();
   BuildingProject buildingProject = BuildingProject.fromJson(doc.data());
   buildingProject.projectuuId = doc.id;
   return buildingProject;

  }


  Future updateProject(BuildingProject buildingProject) async {
    return await projectCollection.doc(uid).update(
        buildingProject.toJson()
    );

  }

}