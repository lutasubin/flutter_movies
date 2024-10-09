part of 'movie_info_bloc.dart';

class LoadMovies extends MoviesEvent {}

abstract class MoviesEvent {}

//! MoviesEvent là một lớp trừu tượng cho tất cả các sự kiện liên quan đến phim.
//! LoadMovies là một sự kiện cụ thể dùng để yêu cầu tải phim.