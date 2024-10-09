import 'package:equatable/equatable.dart';

abstract class ForgotPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ForgotPasswordButtonPressed extends ForgotPasswordEvent {
  final String email;

  ForgotPasswordButtonPressed(this.email);

  @override
  List<Object?> get props => [email];
}