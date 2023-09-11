import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movieapp/models/cast_model.dart';
import 'package:movieapp/models/movie_details.dart';
import 'package:movieapp/models/movie_model.dart';

class ApiService {
  Dio dio = Dio(BaseOptions(
    baseUrl: "https://api.themoviedb.org/3",
    queryParameters: {"api_key": "0c8c1d8e24060b51df2b49a409e811c0"},
  ));

  Future<MovieModel?> getTrendingMoviesofWeek() async {
    try {
      Response response = await dio.get("/trending/movie/week");
      log("${response.statusCode}");
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return movieModelFromJson(jsonString);
      }
      return null;
    } on DioException catch (e) {
      log("${e.message}");
      return null;
    }
  }

  Future<MovieModel?> getTrendingMoviesofDay() async {
    try {
      Response response = await dio.get("/trending/movie/day");
      log("${response.statusCode}");
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return movieModelFromJson(jsonString);
      }
      return null;
    } on DioException catch (e) {
      log("${e.message}");
      return null;
    }
  }

  Future<MovieModel?> getNowPlayingMoviesofDay() async {
    try {
      Response response = await dio.get(
        "/movie/now_playing",
      );
      log("${response.statusCode}");
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return movieModelFromJson(jsonString);
      }
      return null;
    } on DioException catch (e) {
      log("${e.message}");
      return null;
    }
  }

  Future<MovieModel?> getUoComingMoviesofDay() async {
    try {
      Response response = await dio.get("/movie/upcoming");
      log("${response.statusCode}");
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return movieModelFromJson(jsonString);
      }
      return null;
    } on DioException catch (e) {
      log("${e.message}");
      return null;
    }
  }

  Future<MovieModel?> getTopRatedMoviesofDay() async {
    try {
      Response response = await dio.get("/movie/upcoming");
      log("${response.statusCode}");
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return movieModelFromJson(jsonString);
      }
      return null;
    } on DioException catch (e) {
      log("${e.message}");
      return null;
    }
  }

  Future<CastModel?> getCastDetailsOfMoviesofDay(int id) async {
    try {
      Response response = await dio.get("/movie/$id/credits");
      log("${response.statusCode}");
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return castModelFromJson(jsonString);
      }
      return null;
    } on DioException catch (e) {
      log("${e.message}");
      return null;
    }
  }

  Future<MovieDetails?> getMovieDetailsOfMoviesofDay(int id) async {
    try {
      Response response = await dio.get("/movie/$id");
      log("${response.statusCode}");
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return movieDetailsFromJson(jsonString);
      }
      return null;
    } on DioException catch (e) {
      log("${e.message}");
      return null;
    }
  }

  Future<MovieModel?> getSearchMovies(String moviename) async {
    try {
      Response response =
          await dio.get("/search/movie", queryParameters: {"query": moviename});
      log("${response.statusCode}");
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return movieModelFromJson(jsonString);
      }
      return null;
    } on DioException catch (e) {
      log("${e.message}");
      return null;
    }
  }

  Future<MovieModel?> getMalayalamMovies() async {
    try {
      Response response = await dio.get("/discover/movie",
          queryParameters: {"with_original_language": "ml"});
      log("${response.statusCode}");
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return movieModelFromJson(jsonString);
      }
      return null;
    } on DioException catch (e) {
      log("${e.message}");
      return null;
    }
  }

  Future<MovieModel?> getTamilMovies() async {
    try {
      Response response = await dio.get("/discover/movie",
          queryParameters: {"with_original_language": "ta"});
      log("${response.statusCode}");
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return movieModelFromJson(jsonString);
      }
      return null;
    } on DioException catch (e) {
      log("${e.message}");
      return null;
    }
  }

  Future<MovieModel?> getHindiMovies() async {
    try {
      Response response = await dio.get("/discover/movie",
          queryParameters: {"with_original_language": "hi"});
      log("${response.statusCode}");
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return movieModelFromJson(jsonString);
      }
      return null;
    } on DioException catch (e) {
      log("${e.message}");
      return null;
    }
  }

  Future<MovieModel?> getEnglishMovies() async {
    try {
      Response response = await dio.get("/discover/movie",
          queryParameters: {"with_original_language": "en"});
      log("${response.statusCode}");
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return movieModelFromJson(jsonString);
      }
      return null;
    } on DioException catch (e) {
      log("${e.message}");
      return null;
    }
  }
}
