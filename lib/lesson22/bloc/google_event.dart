import 'package:equatable/equatable.dart';

abstract class GoogleEvent extends Equatable {
  const GoogleEvent();

  @override
  List<Object> get props => [];
}

final class GoogleLoginPressed extends GoogleEvent {}
