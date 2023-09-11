import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/cast_model.dart';
import 'package:movieapp/models/movie_details.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/services/api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final getTrendingMoviesProviderWeek = FutureProvider<MovieModel?>((ref) {
  return ref.read(apiServiceProvider).getTrendingMoviesofWeek();
});
final getTrendingMoviesProviderDay = FutureProvider<MovieModel?>((ref) {
  return ref.read(apiServiceProvider).getTrendingMoviesofDay();
});

final getNowPlayingMoviesProvider = FutureProvider<MovieModel?>((ref) {
  return ref.read(apiServiceProvider).getNowPlayingMoviesofDay();
});

final getUpComingMoviesProvider = FutureProvider<MovieModel?>((ref) {
  return ref.read(apiServiceProvider).getUoComingMoviesofDay();
});

final getTopRatedMoviesProvider = FutureProvider<MovieModel?>((ref) {
  return ref.read(apiServiceProvider).getTopRatedMoviesofDay();
});

final getCastProvider = FutureProvider.family<CastModel?, int>((ref, id) {
  return ref.read(apiServiceProvider).getCastDetailsOfMoviesofDay(id);
});

final getDetailsProvider = FutureProvider.family<MovieDetails?, int>((ref, id) {
  return ref.read(apiServiceProvider).getMovieDetailsOfMoviesofDay(id);
});

final getMalayalamMovies = FutureProvider<MovieModel?>((ref) {
  return ref.read(apiServiceProvider).getMalayalamMovies();
});

final getTamilMovies = FutureProvider<MovieModel?>((ref) {
  return ref.read(apiServiceProvider).getTamilMovies();
});

final getHindiMovies = FutureProvider<MovieModel?>((ref) {
  return ref.read(apiServiceProvider).getHindiMovies();
});

final getEnglishMovies = FutureProvider<MovieModel?>((ref) {
  return ref.read(apiServiceProvider).getEnglishMovies();
});
//!------------------------------Search---------------------------------!//

final movienameProvider = StateProvider<String>((ref) {
  return "";
});

final searchmovieProvider = FutureProvider<MovieModel?>((ref) {
  return ref
      .watch(apiServiceProvider)
      .getSearchMovies(ref.watch(movienameProvider));
});
