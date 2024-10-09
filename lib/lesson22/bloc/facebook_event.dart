
import 'package:equatable/equatable.dart';

abstract class FacebookEvent extends Equatable {
  const FacebookEvent();

  @override
  List<Object> get props => [];
}

final class FacebookLoginPressed extends FacebookEvent {}
