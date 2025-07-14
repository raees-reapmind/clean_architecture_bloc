import '../../movies_model_with_freezed/models/movies/movies.dart';

abstract class MoviesRepository {
  Future<MoviesModel> fetchMovies();
}