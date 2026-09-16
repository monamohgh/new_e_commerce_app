//todo:interface=>auth repository
import 'package:new_e_commerce_app/core/network/api_result.dart';
import 'package:new_e_commerce_app/features/auth/domain/entities/request/login/login_request.dart';
import 'package:new_e_commerce_app/features/auth/domain/entities/request/register/register_request.dart';

abstract class AuthRepository {
  ///Future<AuthResponse> call=>Future<void> call
  ///because i don't want the response(name,phone....) to show it in the ui
  ///i have two types of api result=>success,error in ApiResult class=>ApiResult<T>
  Future<ApiResult<void>>login(LoginRequest loginRequest);
  Future<ApiResult<void>>register(RegisterRequest registerRequest);
}