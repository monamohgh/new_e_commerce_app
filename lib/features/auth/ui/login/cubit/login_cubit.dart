import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_e_commerce_app/core/utils/resource.dart';
import 'package:new_e_commerce_app/features/auth/domain/entities/request/login/login_request.dart';
import 'package:new_e_commerce_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:new_e_commerce_app/features/auth/ui/login/cubit/login_states.dart';
class  LoginCubit extends Cubit<LoginStates> {
  ///viewModel want object from use case
   final LoginUseCase _loginUseCase;
LoginCubit({required this._loginUseCase}):super(LoginStates.initial());
void login(String email,String password)async{
  //todo:loading
  emit(LoginStates(loginState: Resource.loading()));
  //todo:login=>useCase=>repository=>remote ds =>api client
/// _loginUseCase.call(loginRequest);
  /// another way when i usw call:
  LoginRequest loginRequest=LoginRequest(
    email: email,
    password:password,
  );
  ///Future<ApiResult<void>>
var result= await _loginUseCase(loginRequest);
  if(result.isSuccess){
    //todo:success=>
   emit(LoginStates(loginState: Resource.success(data: null)));
  }else{
    //todo:error=>
emit(LoginStates(loginState: Resource.error(errorMessage: result.getError.error)));
  }
}
}