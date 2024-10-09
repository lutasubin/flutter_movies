

import 'package:equatable/equatable.dart';

abstract class FacebookState extends Equatable {
  const FacebookState();

  @override
  List<Object> get props => [];
}

final class FacebookInitial extends FacebookState {}

final class FacebookLoading extends FacebookState {}

final class FacebookLoginSuccess extends FacebookState {
  final String successMessage;

  const FacebookLoginSuccess(this.successMessage);

  @override
  List<Object> get props => [successMessage];
}

final class FacebookLoginFailure extends FacebookState {
  final String errorMessage;

  const FacebookLoginFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
