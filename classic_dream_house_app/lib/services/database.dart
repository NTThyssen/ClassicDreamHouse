import 'package:classic_cream_couse/Model/buildingProject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  final CollectionReference projectCollection = FirebaseFirestore.instance.collection("projects");




  Stream<BuildingProject> projectStream(String doc){
    return projectCollection.doc(doc).snapshots().map((snap) {
      print(BuildingProject.fromJson(snap.data as Map<String, dynamic>));
      return BuildingProject.fromJson(snap.data as Map<String, dynamic>); });
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