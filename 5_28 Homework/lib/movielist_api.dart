import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'movielist_api.g.dart';

@RestApi(baseUrl: "https://api.tvmaze.com/")
abstract class MovieListRestClient {
  factory MovieListRestClient(Dio dio, {String baseUrl}) = _MovieListRestClient;

  @GET("/search/shows")
  Future<List<MovieList>> getMovieList(
      @Query("q") String q
      );
}


@JsonSerializable()
class MovieList {

  int? id;
  String? name;
  String? language;
  int? runtime;
  List<String>? genres;
  String? summary;
  String? premiered;
  String? network;
  String? image;


  MovieList({this.id, this.name, this.language, this.runtime, this.summary, this.premiered, this.genres, this.network, this.image});

  factory MovieList.fromJson(Map<String, dynamic> json) => _$MovieListFromJson(json);

}
