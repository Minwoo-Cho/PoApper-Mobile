import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';


part 'schedule_api.g.dart';

@RestApi(baseUrl: "https://api.tvmaze.com/schedule")
abstract class ScheduleRestClient {
  factory ScheduleRestClient(Dio dio, {String baseUrl}) = _ScheduleRestClient;

  @GET("/")
  Future<List<Schedule>> getSchedule(
      @Query("date") String date,
      @Query("country") String country,
      );
}


@JsonSerializable()
class Schedule {


  String? title;
  String? airdate;
  String? airtime;
  String? summary;





  Schedule({this.title, this.airdate, this.airtime, this.summary});

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);

}
