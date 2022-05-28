// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieInfo _$MovieInfoFromJson(Map<String, dynamic> json) => MovieInfo(
      id: json['id'] as int?,
      name: json['name'] as String?,
      language: json['language'] as String?,
      runtime: json['runtime'] as int?,
      summary: json['summary'] as String?,
      premiered: json['premiered'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
  network: ((json['network'] != null) ? json['network']['name'] : json['webChannel']['name'] as String?),
  image: json["image"]["original"] as String?,
    );

Map<String, dynamic> _$MovieInfoToJson(MovieInfo instance) => <String, dynamic>{
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

class _MovieRestClient implements MovieRestClient {
  _MovieRestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.tvmaze.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<MovieInfo> getMovieInfo(q) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'q': q};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MovieInfo>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/singlesearch/shows',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MovieInfo.fromJson(_result.data!);
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
