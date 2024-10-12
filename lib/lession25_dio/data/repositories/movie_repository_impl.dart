
import 'package:flutter_firebase/lession25_dio/data/datasources/movie_remote_data_source.dart';
import 'package:flutter_firebase/lession25_dio/domain/entities/genre.dart';
import 'package:flutter_firebase/lession25_dio/domain/entities/image_configuration.dart';
import 'package:flutter_firebase/lession25_dio/domain/entities/movie.dart';
import 'package:flutter_firebase/lession25_dio/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Genre>?> getGenre() {
    return remoteDataSource.getGenre();
  }

  @override
  Future<ImageConfigInfo?> getImageInfo() {
    return remoteDataSource.getImageConfigInfo();
  }

  @override
  Future<List<Movie>?> getMovies() {
    return remoteDataSource.getMovies();
  }
}