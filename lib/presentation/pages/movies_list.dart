import 'package:flutter/material.dart';
import 'package:testdriven_app/domain/entities/movie.dart';
import 'package:testdriven_app/presentation/widgets/movie_card.dart';


class MoviesList extends StatelessWidget {
  final List<Movie> movies;

  const MoviesList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(movies.length, (index) {
          final movie = movies[index];
          return MovieCard(movie);
        }),
      ),
    );
  }
}

