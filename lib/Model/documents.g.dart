// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Documents _$DocumentsFromJson(Map<String, dynamic> json) {
  return Documents(
    title: json['title'] as String,
    uri: json['uri'] as String,
  );
}

Map<String, dynamic> _$DocumentsToJson(Documents instance) => <String, dynamic>{
      'title': instance.title,
      'uri': instance.uri,
    };
