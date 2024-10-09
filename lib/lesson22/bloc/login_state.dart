import 'package:equatable/equatable.dart';
abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class SuccessfullyLoginState extends LoginState {
  final String successfulMsg;
  
  const SuccessfullyLoginState({required this.successfulMsg});

  @override
  List<Object?> get props => [successfulMsg];
}

class FailedLoginState extends LoginState {
  final String errorMessage;
  
  const FailedLoginState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class LoadingState extends LoginState {}
