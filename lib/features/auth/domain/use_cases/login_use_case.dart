import 'package:new_e_commerce_app/core/network/api_result.dart';
import 'package:new_e_commerce_app/features/auth/domain/entities/request/login/login_request.dart';
import 'package:new_e_commerce_app/features/auth/domain/repository/auth_repository.dart';


class LoginUseCase {
  ///Use case want object from repository
  final AuthRepository _authRepository;
  LoginUseCase({required this._authRepository});
  ///3 names for the methods in use case  if i choose one i should use in all project
  /// 1- call
  /// 2- invoke
  /// 3- execute
  ///Future<AuthResponse> call=>Future<void> call
  ///because i don't want the response(name,phone....) to show it in the ui
  ///i have two types of api result=>success,error in ApiResult class=>ApiResult<T>
  Future<ApiResult<void>> call (LoginRequest loginRequest){
   return _authRepository.login(loginRequest);
 }
}