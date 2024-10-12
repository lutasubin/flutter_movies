
import 'package:flutter_firebase/lession25_dio/domain/entities/genre.dart';
import 'package:flutter_firebase/lession25_dio/domain/entities/image_configuration.dart';
import 'package:flutter_firebase/lession25_dio/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Genre>?> getGenre();
  Future<ImageConfigInfo?> getImageInfo();
  Future<List<Movie>?> getMovies();
}