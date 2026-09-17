import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:new_e_commerce_app/core/utils/resource.dart';
import 'package:new_e_commerce_app/features/auth/domain/entities/request/register/register_request.dart';
import 'package:new_e_commerce_app/features/auth/domain/use_cases/register_use_case.dart';
import 'package:new_e_commerce_app/features/auth/ui/register/cubit/register_states.dart';
@injectable
class  RegisterCubit extends Cubit<RegisterStates> {
  ///viewModel want object from use case
  final RegisterUseCase _registerUseCase;
  RegisterCubit({required this._registerUseCase}):super(RegisterStates.initial());
  void register(String email,String password,
      String phone,String rePassword,String name
      )async{
    //todo:loading
    emit(RegisterStates(registerState: Resource.loading()));
    //todo:register=>useCase=>repository=>remote ds =>api client
    /// _loginUseCase.call(loginRequest);
    /// another way when i usw call:
    RegisterRequest registerRequest=RegisterRequest(
      email:email ,
      rePassword:password ,
        phone:phone ,
      name:name ,
      password:password ,
    );
    ///Future<ApiResult<void>>
    var result= await _registerUseCase(registerRequest);
    if(result.isSuccess){
      //todo:success=>
      emit(RegisterStates(registerState: Resource.success(data: null)));
    }else{
      //todo:error=>
      emit(RegisterStates(registerState: Resource.error(errorMessage: result.getError.error)));
    }
  }
}

