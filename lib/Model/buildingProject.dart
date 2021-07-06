
import 'package:classic_cream_couse/Model/customer.dart';
import 'package:classic_cream_couse/Model/documents.dart';
import 'package:classic_cream_couse/Model/timelineData.dart';
import 'package:json_annotation/json_annotation.dart';
part 'buildingProject.g.dart';

@JsonSerializable(explicitToJson: true)
class BuildingProject {
  String projectuuId;
  List<Documents> documents;
  final Customer customer;
  List<TimelineData> timeLineData;
  BuildingProject({this.customer, this.projectuuId, this.timeLineData, this.documents} );


  factory BuildingProject.fromJson(Map<String, dynamic> json) => _$BuildingProjectFromJson(json);

  Map<String, dynamic> toJson() => _$BuildingProjectToJson(this);

}