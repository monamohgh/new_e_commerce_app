import 'package:injectable/injectable.dart';
import 'package:new_e_commerce_app/features/auth/domain/entities/request/register/register_request.dart';
import 'package:new_e_commerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:new_e_commerce_app/features/network/api/api_result.dart';
@lazySingleton
class RegisterUseCase {
  ///Use case want object from repository
final AuthRepository _authRepository;
RegisterUseCase({required this._authRepository});
///Future<AuthResponse> call=>Future<void> call
///because i don't want the response(name,phone....) to show it in the ui
 ///i have two types of api result=>success,error in ApiResult class=>ApiResult<T>
Future<ApiResult<void>> call (RegisterRequest registerRequest){
  return _authRepository.register(registerRequest);
}

}