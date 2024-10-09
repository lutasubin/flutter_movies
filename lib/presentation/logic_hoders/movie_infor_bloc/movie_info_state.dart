part of 'movie_info_bloc.dart';

class MoviesLoading extends MoviesState {}//! trang thai ung dung tai danh sach

abstract class MoviesState {}

class MoviesInitial extends MoviesState {} //!trang thai ban dau, khi chua co hanh dong nao xay ra

class MoviesLoaded extends MoviesState {  //!trang thai danh sach tai thanh cong chua du lieu phim
  final List<Movie> movies;
  MoviesLoaded(this.movies);
}
class MoviesError extends MoviesState { //! trang thai loi xay ra trong qua trinh tai phim ,chua thong 
  final String message;                 //!loi de hien thi cho nguoi  dung 
  MoviesError(this.message);
}