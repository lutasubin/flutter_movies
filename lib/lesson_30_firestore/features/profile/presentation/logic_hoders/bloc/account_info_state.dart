// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'account_info_bloc.dart';

class AccountInfoState extends Equatable {
  final StatusState status;
  final AccountEntity? accountDataFromFirestore;
  final AccountEntity updatedLocalAccountData;
  final String? successMsg;
  final String? errorMsg;
  const AccountInfoState({
    this.status = StatusState.idle,
    this.accountDataFromFirestore,
    this.updatedLocalAccountData = const AccountEntity(),
    this.successMsg,
    this.errorMsg,
  });

  @override
  List<Object?> get props => [
        status,
        accountDataFromFirestore,
        updatedLocalAccountData,
        successMsg,
        errorMsg,
      ];

  AccountInfoState copyWith({
    StatusState? status,
    AccountEntity? accountDataFromFirestore,
    AccountEntity? updatedLocalAccountData,
    String? successMsg,
    String? errorMsg,
  }) {
    return AccountInfoState(
      status: status ?? this.status,
      accountDataFromFirestore:
          accountDataFromFirestore ?? this.accountDataFromFirestore,
      updatedLocalAccountData:
          updatedLocalAccountData ?? this.updatedLocalAccountData,
      successMsg: successMsg ,
      errorMsg: errorMsg ,
    );
  }
}