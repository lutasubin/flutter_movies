// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'global_info_bloc.dart';

class GlobalInfoError extends GlobalInfoState {
  final String? message;
  GlobalInfoError({
    this.message,
  });
}

class GlobalInfoInitial extends GlobalInfoState {}

class GlobalInfoLoaded extends GlobalInfoState {
  final List<Genre>? genreList;
  final ImageConfigInfo? imageConfigInfo;
  GlobalInfoLoaded({
    required this.genreList,
    required this.imageConfigInfo,
  });
}

class GlobalInfoLoading extends GlobalInfoState {}

abstract class GlobalInfoState {}