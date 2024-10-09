

import 'package:equatable/equatable.dart';

abstract class GoogleState extends Equatable {
  const GoogleState();

  @override
  List<Object> get props => [];
}

final class GoogleInitial extends GoogleState {}

final class GoogleLoading extends GoogleState{}

final class GoogleLoginSuccess extends GoogleState {
  final String successMessage;

  const GoogleLoginSuccess(this.successMessage);

  @override
  List<Object> get props => [successMessage];
}

final class GoogleLoginFailure extends GoogleState {
  final String errorMessage;

  const GoogleLoginFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
