import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testdriven_app/domain/usecases/get_popular_movies.dart';
import 'package:testdriven_app/presentation/bloc/popular_movies/popular_movie_event.dart';
import 'package:testdriven_app/presentation/bloc/popular_movies/popular_movie_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState>{
  final GetPopularMovies getPopularMovies;

  PopularMoviesBloc({required this.getPopularMovies}) : super(PopularMoviesInitial()) {
    on<FetchPopularMovies>((event, emit) async {
      emit(PopularMoviesLoading());
      final failureOrMovies = await getPopularMovies();
      failureOrMovies.fold(
              (failure) => emit(PopularMoviesError(failure.toString())),
              (movies) => emit(PopularMoviesLoaded(movies)));
    });
  }
}