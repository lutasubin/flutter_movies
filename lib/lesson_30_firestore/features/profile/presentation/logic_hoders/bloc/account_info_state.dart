// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'account_info_bloc.dart';

class AccountInfoState {
  final StatusState status;
  final AccountEntity? accountDataFromFirestore;
  final AccountEntity? updatedLocalAccountData;
  final String? successMsg;
  final String? errorMsg;
  AccountInfoState({
    this.status = StatusState.idle,
    this.accountDataFromFirestore,
    this.updatedLocalAccountData,
    this.successMsg,
    this.errorMsg,
  });
}
