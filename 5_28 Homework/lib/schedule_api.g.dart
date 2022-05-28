// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
  title: json['show']['name'] as String?,
  airdate: json['airdate'] as String?,
  airtime: json['airtime'] as String?,
  summary: json['summary'] as String?,



);



Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'title': instance.title,
  'airdate' : instance.airdate,
  'airtime' : instance.airtime,
  'summary' : instance.summary,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ScheduleRestClient implements ScheduleRestClient {
  _ScheduleRestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.tvmaze.com/schedule';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Schedule>> getSchedule(date, country) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'date': date,
      r'country': country
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Schedule>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Schedule.fromJson(i as Map<String, dynamic>))
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
