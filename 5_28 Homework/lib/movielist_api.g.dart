// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movielist_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieList _$MovieListFromJson(Map<String, dynamic> json) => MovieList(
  id: json['id'] as int?,
  name: json['show']['name'] as String?,
  language: json['show']['language'] as String?,
  runtime: json['show']['runtime'] as int?,
  summary: json['show']['summary'] as String?,
  premiered: json['show']['premiered'] as String?,
  genres:
  (json['show']['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
  network: ((json['show']['network'] == null ? json['show']['webChannel']['name'] : json['show']['network']['name']) as String?),
  image: "img",//json['show']['image']['original'] as String?,



);



Map<String, dynamic> _$MovieListToJson(MovieList instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'language': instance.language,
  'runtime': instance.runtime,
  'genres': instance.genres,
  'summary': instance.summary,
  'premiered': instance.premiered,
  'network' : instance.network,
  'image' : instance.image,
};

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _MovieListRestClient implements MovieListRestClient {
  _MovieListRestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.tvmaze.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<MovieList>> getMovieList(q) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'q': q,

    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MovieList>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/search/shows',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => MovieList.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
