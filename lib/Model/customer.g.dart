// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    livingAddress: json['livingAddress'] as String,
    email: json['email'] as String,
    name: json['name'] as String,
    buildingAddress: json['buildingAddress'] as String,
    partnerName: json['partnerName'] as String,
    mobile: json['mobile'] as String,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'name': instance.name,
      'partnerName': instance.partnerName,
      'mobile': instance.mobile,
      'email': instance.email,
      'livingAddress': instance.livingAddress,
      'buildingAddress': instance.buildingAddress,
    };
