// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';
import 'package:flutter_firebase/core/services/logger_services.dart';
import 'package:flutter_firebase/data/models/movie_model.dart';

import '../../domain/entities/movie.dart';

// const apiKey =
//     "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZWY5MThiMDliZjI2ZjZmYTMyYTZkOWRlYmNlNDQ5OCIsIm5iZiI6MTcyODA1MTk4OC43Nzk0MTksInN1YiI6IjY2ZmZmMGVjYzlhMTBkNDZlYTdjZDM2ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2lUqZNkqMCOn2Zj425SR_h99HX19kmgI3zU7JmTpQ4A";

abstract class MovieRemoteDataSource {
  Future<List<Movie>> getMovies();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl({
    required this.dio,
  });
  @override
  Future<List<Movie>> getMovies() async {
    final queryParams = {'language': 'en-US', 'page': '1'};

    try {
      final result =
          await dio.get("/movie/now_playing", queryParameters: queryParams);
      final List<dynamic> moviesJson = result.data['results'];
      // print(moviesJson);
      //! Sử dụng Model trong DataSource
      return moviesJson.map((json) => MovieModel.fromJson(json)).toList();
    }
    //! Error Handling
    on DioException catch (e) {
      printF(
          "[DioException] error type: ${e.type}, error message: ${e.message}");
    } catch (e) {
      printF("Unknown error: ${e.toString()}");
    }

    return [];
  }
}

//!MovieRemoteDataSourceImpl là lớp triển khai của MovieRemoteDataSource, có nhiệm vụ
//!thực hiện yêu cầu HTTP GET tới API TMDb để lấy danh sách các phim hiện đang chiếu (now_playing).

