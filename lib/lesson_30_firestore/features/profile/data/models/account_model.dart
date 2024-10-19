// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_firebase/lesson_30_firestore/features/profile/domain/entities/account_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel extends AccountEntity {
  @JsonKey(name: 'user_id')
  @override
  final String? userId;
  @JsonKey(name: 'avatar_url')
  @override
  final String? avatarUrl;
  @JsonKey(name: 'full_name')
  @override
  final String? fullName;
  @override
  final DateTime? dob;
  @JsonKey(name: 'phone_number')
  @override
  final String? phoneNumber;
  @override
  final String? email;
  @override
  final int? gender;
  AccountModel({
    this.userId,
    this.avatarUrl,
    this.fullName,
    this.dob,
    this.phoneNumber,
    this.email,
    this.gender,
  }) : super(
          userId: userId,
          avatarUrl: avatarUrl,
          fullName: fullName,
          dob: dob,
          phoneNumber: phoneNumber,
          email: email,
          gender: gender,
        );
  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
