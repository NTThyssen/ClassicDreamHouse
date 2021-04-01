
import 'package:classic_cream_couse/Model/customer.dart';
import 'package:json_annotation/json_annotation.dart';
part 'buildingProject.g.dart';

@JsonSerializable(explicitToJson: true)
class BuildingProject {
  final String projectuuId;
  final Customer customer;
  BuildingProject({this.customer, this.projectuuId} );


  factory BuildingProject.fromJson(Map<String, dynamic> json) => _$BuildingProjectFromJson(json);

  Map<String, dynamic> toJson() => _$BuildingProjectToJson(this);

}