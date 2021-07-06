// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timelineData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimelineData _$TimelineDataFromJson(Map<String, dynamic> json) {
  return TimelineData(
    title: json['title'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
  );
}

Map<String, dynamic> _$TimelineDataToJson(TimelineData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'status': _$StatusEnumMap[instance.status],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$StatusEnumMap = {
  Status.notStarted: 'notStarted',
  Status.started: 'started',
  Status.complete: 'complete',
};
