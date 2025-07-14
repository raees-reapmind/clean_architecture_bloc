
part of 'movies_bloc.dart';

class MoviesStates extends Equatable {
  const MoviesStates
    ({
      required this.moviesList
    });

  final ApiResponse<MoviesModel> moviesList;

  MoviesStates copyWith({
    ApiResponse<MoviesModel>? moviesList
  }) {
    return MoviesStates(moviesList: moviesList ?? this.moviesList);
  }

  @override
  List<Object?> get props => [moviesList]; 
}