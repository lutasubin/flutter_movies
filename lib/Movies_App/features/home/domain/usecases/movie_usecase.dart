//! Bước 1: Tạo Entities và Use Cases


//!  use case để xử lý nghiệp vụ, ở đây có nghiệp vụ lấy danh sách phim

import 'package:flutter_firebase/Movies_App/features/home/domain/entities/movie.dart';
import 'package:flutter_firebase/Movies_App/features/home/domain/repositories/movie_repository.dart';

class GetMovies {
  final MovieRepository repository;

  GetMovies(this.repository);

  Future<List<Movie>?> getNowPlayingMovies() async {
    return await repository.getMovies();
  }

  Future<List<Movie>?> getUpcommingMovie() {
    return repository.getUpcommingMovies();
  }
}