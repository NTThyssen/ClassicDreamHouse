import 'package:json_annotation/json_annotation.dart';
part 'customer.g.dart';

@JsonSerializable(explicitToJson: true)

class Customer {
  final String name;
  final String partnerName;
  final String mobile;
  final String email;
  final String livingAddress;
  final String buildingAddress;



  Customer({this.livingAddress, this.email, this.name, this.buildingAddress, this.partnerName, this.mobile});

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);

}