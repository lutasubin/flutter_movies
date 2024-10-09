import 'package:flutter_firebase/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies();
}
//!MovieRepository là một giao diện trừu tượng để lấy danh sách phim từ một nguồn dữ liệu, cung cấp một phương thức là getMovies().
//!getMovies() trả về một Future chứa danh sách các bộ phim, cho phép ứng dụng truy xuất dữ liệu không đồng bộ.