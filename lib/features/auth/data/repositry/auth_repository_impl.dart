//todo:impl=>repo
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:new_e_commerce_app/core/errors/app_errors.dart';
import 'package:new_e_commerce_app/core/network/api_result.dart';
import 'package:new_e_commerce_app/core/utils/connectivity_extensions.dart';
import 'package:new_e_commerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:new_e_commerce_app/features/auth/data/mappers/login_request_mappers.dart';
import 'package:new_e_commerce_app/features/auth/data/mappers/register_request_mappers.dart';
import 'package:new_e_commerce_app/features/auth/domain/entities/request/login/login_request.dart';
import 'package:new_e_commerce_app/features/auth/domain/entities/request/register/register_request.dart';
import 'package:new_e_commerce_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource _authRemoteDataSource;
  final Connectivity _connectivity;
  AuthRepositoryImpl({required this._authRemoteDataSource,required this._connectivity});
  @override
  Future<ApiResult<void>> login(LoginRequest loginRequest)async {
  if(await _connectivity.isConnected()){
    //todo:internet=>remote ds
    //todo:LoginRequest=>LoginRequestDto=>Mappers
    //todo:Mappers/convert from models in dto to models in entity
    return _authRemoteDataSource.login(loginRequest.toLoginRequestDto());
    }else{
    //todo:no internet=>local ds
    return ErrorApiResult(errorMessage: NetworkError());
    }
  }

  @override
  Future<ApiResult<void>> register(RegisterRequest registerRequest)async {
   if( await _connectivity.isConnected()){
     //todo:internet=>remote ds
     //todo:RegisterRequest=>RegisterRequestDto=>Mappers
     return _authRemoteDataSource.register(registerRequest.toRegisterRequestDto());
   }else{
     //todo:no internet=>local ds
     return ErrorApiResult(errorMessage: NetworkError());
   }
  }
}