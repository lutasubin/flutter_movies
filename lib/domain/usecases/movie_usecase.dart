//!  use case để xử lý nghiệp vụ, ở đây có nghiệp vụ lấy danh sách phim
import 'package:flutter_firebase/domain/entities/movie.dart';
import 'package:flutter_firebase/domain/repositories/movie_repository.dart';

class GetMovies {
  final MovieRepository repository;

  GetMovies(this.repository);

  Future<List<Movie>> call() async {
    return await repository.getMovies();
  }
}
//!Tầng domain (nghiệp vụ) của ứng dụng, chứa logic lấy phim.
//!Giúp tách biệt logic nghiệp vụ khỏi tầng dữ liệu và giao diện.
//!Dễ dàng thay đổi cách lấy dữ liệu mà không ảnh hưởng đến phần còn lại của ứng dụng,
//!bởi vì repository có thể được thay thế một cách dễ dàng.