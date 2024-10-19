// ignore_for_file: public_member_api_docs, sort_constructors_first
class AccountEntity {
  final String? userId;
  final String? avatarUrl;
  final String? fullName;
  final DateTime? dob;
  final String? phoneNumber;
  final String? email;
  final int? gender;
  AccountEntity({
    required this.userId,
    required this.avatarUrl,
    required this.fullName,
    required this.dob,
    required this.phoneNumber,
    required this.email,
    required this.gender,
  });
}
