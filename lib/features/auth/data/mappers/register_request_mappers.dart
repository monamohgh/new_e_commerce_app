import 'package:new_e_commerce_app/features/auth/data/models/request/register/register_request_dto.dart';
import 'package:new_e_commerce_app/features/auth/domain/entities/request/register/register_request.dart';

extension RegisterRequestMappers on RegisterRequest{
  ///method to convert RegisterRequest=>RegisterRequestDto=>Mappers
  RegisterRequestDto toRegisterRequestDto(){
    return RegisterRequestDto(
    password:password ,
      email:email ,
      name:name ,
      phone:phone ,
      rePassword:rePassword ,
    );
  }
}