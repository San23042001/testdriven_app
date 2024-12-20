import 'dart:convert';

import 'package:testdriven_app/core/errors/server_exception.dart';
import 'package:testdriven_app/data/models/movie_models.dart';
import 'package:http/http.dart' as http;

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrendingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> searchMovies(String query);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  static const BASE_URL = 'https://api.themoviedb.org/3';
  static const API_KEY = 'd3f729ebcf92877f490a10f8e8d97a80';

  MovieRemoteDataSourceImpl({required this.client});
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response =
        await client.get(Uri.parse("$BASE_URL/movie/popular?api_key=$API_KEY"));
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await client.get(
      Uri.parse("$BASE_URL/trending/movie/day?api_key=$API_KEY"),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await client.get(
      Uri.parse("$BASE_URL/search/movie?query=$query&api_key=$API_KEY"),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }
}
