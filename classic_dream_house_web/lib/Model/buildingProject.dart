

import 'package:classic_dream_house_web/Model/customer.dart';
import 'package:json_annotation/json_annotation.dart';
part 'buildingProject.g.dart';

@JsonSerializable()
class BuildingProject {
  final String projectId;
  final Customer customer;
  BuildingProject(this.customer, this.projectId );


  factory BuildingProject.fromJson(Map<String, dynamic> json) => _$BuildingProjectFromJson(json);

  Map<String, dynamic> toJson() => _$BuildingProjectToJson(this);

}