import 'package:dio/dio.dart';
import 'package:flutter_firebase/lession25_dio/core/services/logger_service.dart';
import 'package:flutter_firebase/lession25_dio/data/models/genre_model.dart';
import 'package:flutter_firebase/lession25_dio/data/models/image_config_info_model.dart';
import 'package:flutter_firebase/lession25_dio/data/models/movie_model.dart';

//! Bước 3.1: Tạo Data Sources, sử dụng Model trong DataSource
abstract class MovieRemoteDataSource {
  Future<List<GenreModel>?> getGenre();
  Future<ImageConfigInfoModel?> getImageConfigInfo();
  Future<List<MovieModel>?> getMovies();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<GenreModel>?> getGenre() async {
    final queryParams = {'language': 'en'};
    try {
      final result =
          await dio.get("/genre/movie/list", queryParameters: queryParams);
      final List<dynamic> moviesJson = result.data['genres'];
      //! Sử dụng Model trong DataSource
      return moviesJson.map((json) => GenreModel.fromJson(json)).toList();
    } on DioException catch (e) {
      printE(
          "[DioException] error type: ${e.type}, error message: ${e.message}");
    } catch (e) {
      printE("Unknown error: ${e.toString()}");
    }
    return null;
  }

  @override
  Future<ImageConfigInfoModel?> getImageConfigInfo() async {
    try {
      final result = await dio.get("/configuration");
      return ImageConfigInfoModel.fromJson(result.data['images']);
    } on DioException catch (e) {
      printE(
          "[DioException] error type: ${e.type}, error message: ${e.message}");
    } catch (e) {
      printE("Unknown error: ${e.toString()}");
    }
    return null;
  }

  @override
  Future<List<MovieModel>?> getMovies() async {
    final queryParams = {'language': 'en-US', 'page': 1};

    try {
      final result =
          await dio.get("/movie/now_playing", queryParameters: queryParams);
      final List<dynamic> moviesJson = result.data['results'];
      //! Sử dụng Model trong DataSource
      return moviesJson.map((json) => MovieModel.fromJson(json)).toList();
    }
    //! Error Handling
    on DioException catch (e) {
      printE(
          "[DioException] error type: ${e.type}, error message: ${e.message}");
    } catch (e) {
      printE("Unknown error: ${e.toString()}");
    }

    return null;
  }
}