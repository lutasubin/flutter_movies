part of 'movie_info_bloc.dart';
//! Bước 4.2: Xác định State

class MoviesError extends MoviesState {
  final String message;
  MoviesError(this.message);
}

class MoviesInitial extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<Movie> movies;
  MoviesLoaded(this.movies);
}

class MoviesLoading extends MoviesState {}

abstract class MoviesState {}