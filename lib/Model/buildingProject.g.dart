// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buildingProject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuildingProject _$BuildingProjectFromJson(Map<String, dynamic> json) {
  return BuildingProject(
    customer: json['customer'] == null
        ? null
        : Customer.fromJson(json['customer'] as Map<String, dynamic>),
    projectuuId: json['projectuuId'] as String,
    timeLineData: (json['timeLineData'] as List)
        ?.map((e) =>
            e == null ? null : TimelineData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BuildingProjectToJson(BuildingProject instance) =>
    <String, dynamic>{
      'projectuuId': instance.projectuuId,
      'customer': instance.customer?.toJson(),
      'timeLineData': instance.timeLineData?.map((e) => e?.toJson())?.toList(),
    };
