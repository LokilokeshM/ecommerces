import 'package:dio/dio.dart';
import 'package:ecommerce/Api/api_client.dart';
import 'package:ecommerce/Api/api_config.dart';
import 'package:ecommerce/model/login_request.dart';
import 'package:ecommerce/model/login_response.dart';
import 'package:ecommerce/model/sweeppstakes_response.dart';

abstract class ApiUtil {
  Future<LoginResponse> loginUser(LoginRequest loginRequest);
  Future<SweepstakesList> getSweepstakesList(String val);
}

class ApiUtilWrapper extends ApiUtil {
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")),
      baseUrl: ApiConfig.baseUrl);

  @override
  Future<LoginResponse> loginUser(LoginRequest loginRequest) async {
    final response = await client.loginUser(loginRequest);
    return response;
  }

  @override
  Future<SweepstakesList> getSweepstakesList(String authorization) async {
    final response = await client.getSweepsTakesList(authorization);
    return response;
  }
}
