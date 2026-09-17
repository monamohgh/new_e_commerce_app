import 'package:new_e_commerce_app/features/auth/data/models/request/login/login_request_dto.dart';
import 'package:new_e_commerce_app/features/auth/domain/entities/request/login/login_request.dart';

extension LoginRequestMappers on LoginRequest{
  ///method to convert LoginRequest=>LoginRequestDto=>Mappers
  LoginRequestDto toLoginRequestDto(){
    return LoginRequestDto(
        email: email,
        password: password
    );
  }
}
