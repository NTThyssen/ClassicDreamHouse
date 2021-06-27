
import 'package:classic_cream_couse/Model/status.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'documents.g.dart';

@JsonSerializable(explicitToJson: true)
class Documents {

  String title;
  String uri;

  Documents({this.title, this.uri});

  factory Documents.fromJson(Map<String, dynamic> json) => _$DocumentsFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentsToJson(this);

}