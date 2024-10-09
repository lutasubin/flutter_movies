import 'package:flutter_firebase/data/datasources/movie_remote_data_source.dart';
import 'package:flutter_firebase/domain/entities/movie.dart';
import 'package:flutter_firebase/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Movie>> getMovies() {
    return remoteDataSource.getMovies();
  }
}

//!MovieRepositoryImpl cài đặt giao diện MovieRepository và sử dụng
//!MovieRemoteDataSource để lấy dữ liệu phim từ nguồn từ xa.
//!Khi tầng cao hơn (như Use Case GetMovies) gọi getMovies(), phương thức này sẽ ủy thác
//!cho remoteDataSource lấy dữ liệu từ xa và trả về kết quả là danh sách phim (List<Movie>).