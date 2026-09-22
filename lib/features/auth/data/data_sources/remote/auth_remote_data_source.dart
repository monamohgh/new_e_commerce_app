//todo:interface=>ds
import 'package:new_e_commerce_app/features/network/api/api_result.dart';
import 'package:new_e_commerce_app/features/network/models/request/login/login_request_dto.dart';
import 'package:new_e_commerce_app/features/network/models/request/register/register_request_dto.dart';
import 'package:new_e_commerce_app/features/network/models/response/auth/auth_response_dto.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResult<AuthResponseDto>>login(LoginRequestDto loginRequest);
  Future<ApiResult<AuthResponseDto>>register(RegisterRequestDto registerRequest);
}