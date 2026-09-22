import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:new_e_commerce_app/core/errors/app_errors.dart';
import 'package:new_e_commerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:new_e_commerce_app/features/network/api/api_client.dart';
import 'package:new_e_commerce_app/features/network/api/api_result.dart';
import 'package:new_e_commerce_app/features/network/models/request/login/login_request_dto.dart';
import 'package:new_e_commerce_app/features/network/models/request/register/register_request_dto.dart';
import 'package:new_e_commerce_app/features/network/models/response/auth/auth_response_dto.dart';
//todo:impl=>ds
@Injectable(as:AuthRemoteDataSource )
class  AuthRemoteDataSourceImpl  implements AuthRemoteDataSource{
  final ApiClient _apiClient;
  AuthRemoteDataSourceImpl({ required this._apiClient});

  @override
  Future<ApiResult<AuthResponseDto>> login(LoginRequestDto loginRequest)async {
    try{
     var response=await _apiClient.login(loginRequest);
     return SuccessApiResult(data: response);
    }on DioException catch(e){
      String errorMessage=e.response?.data['message'];
      return ErrorApiResult(errorMessage: ServerError(
        message: errorMessage
      ));
    }
    catch(e){
      return ErrorApiResult(errorMessage: UnKnownError());
    }
  }

  @override
  Future<ApiResult<AuthResponseDto>> register(RegisterRequestDto registerRequest) async{
   try{
     var response=await _apiClient.register(registerRequest);
     return SuccessApiResult(data: response);
   }on DioException catch(e){
     String errorMessage=e.response?.data['errors']?['msg']??e.response?.data['message']??'Something went wrong';
     return ErrorApiResult(errorMessage: ServerError(message: errorMessage) );
   }
   catch(e){
      return ErrorApiResult(errorMessage: UnKnownError());
   }
  }
  
}