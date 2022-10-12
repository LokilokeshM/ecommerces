import 'package:dio/dio.dart';
import 'package:ecommerce/model/login_request.dart';
import 'package:ecommerce/model/login_response.dart';
import 'package:ecommerce/model/sweeppstakes_response.dart';

import 'package:retrofit/retrofit.dart';

import 'api_config.dart';
part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST(ApiConfig.loginUser)
  Future<LoginResponse> loginUser(@Body() LoginRequest loginRequest);

  @GET(ApiConfig.sweepstakesList)
  Future<SweepstakesList> getSweepsTakesList(
      @Header("Authorization") String authorization);
}
