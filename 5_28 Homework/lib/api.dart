import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api.g.dart';

@RestApi(baseUrl: "http://httpbin.org/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/ip")
  Future<IpModel> getIp();
}

@JsonSerializable()
class IpModel {
  String? origin;


  IpModel({this.origin});

  factory IpModel.fromJson(Map<String, dynamic> json) => _$IpModelFromJson(json);
  Map<String, dynamic> toJson() => _$IpModelToJson(this);
}
