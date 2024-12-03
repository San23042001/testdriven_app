import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testdriven_app/injectable.dart';
import 'package:testdriven_app/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:testdriven_app/presentation/bloc/search_movies/search_movie_event.dart';
import 'package:testdriven_app/presentation/bloc/search_movies/search_movies_state.dart';
import 'package:testdriven_app/domain/entities/movie.dart';
import 'package:testdriven_app/presentation/widgets/movie_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter movie title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    final query = _searchController.text.trim();
                    if (query.isNotEmpty) {
                      context
                          .read<SearchMoviesBloc>()
                          .add(FetchSearchMovies(query));
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
                builder: (context, state) {
                  if (state is SearchMoviesInitial) {
                    return const Center(
                        child: Text('Start searching for movies!'));
                  } else if (state is SearchMoviesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchMoviesLoaded) {
                    return _buildMovieList(state.movies);
                  } else if (state is SearchMoviesError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieList(List<Movie> movies) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return MovieCard(movie);
      },
    );
  }
}
