import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart'; 
import 'package:navigations_routing/data/responses/api_response.dart';
import 'package:navigations_routing/movies_model_with_freezed/models/movies/movies.dart';
 
import 'package:navigations_routing/repository/movies/movies_repository.dart';

part 'movies_states.dart';
part 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates>{

  MoviesRepository moviesRepository;
  MoviesBloc({required this.moviesRepository}) : super(MoviesStates(moviesList: ApiResponse.loading())) {
    on<MoviesFetched> (_FetchMovies);
  }

  FutureOr<void> _FetchMovies(MoviesFetched event, Emitter<MoviesStates> emit) async{
    await moviesRepository.fetchMovies().then((value) => {
      emit(state.copyWith(moviesList: ApiResponse.completed(value)))
    }).onError((error, stackTrace) => { 
      emit(state.copyWith(moviesList: ApiResponse.error(error.toString())))
    });
  }
}