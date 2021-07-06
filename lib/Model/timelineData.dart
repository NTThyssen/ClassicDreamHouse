import 'package:classic_cream_couse/Model/status.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'timelineData.g.dart';

@JsonSerializable(explicitToJson: true)
class TimelineData {

  String title;
  Status status;

  TimelineData({this.title, this.status});

  factory TimelineData.fromJson(Map<String, dynamic> json) => _$TimelineDataFromJson(json);

  Map<String, dynamic> toJson() => _$TimelineDataToJson(this);

}