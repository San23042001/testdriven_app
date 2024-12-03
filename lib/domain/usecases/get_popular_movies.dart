import 'package:dartz/dartz.dart';
import 'package:testdriven_app/core/errors/server_failure.dart';
import 'package:testdriven_app/domain/entities/movie.dart';
import 'package:testdriven_app/domain/repositories/movie_repository.dart';

class GetPopularMovies{
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getPopularMovies();
  }
}
