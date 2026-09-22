import 'package:new_e_commerce_app/core/errors/app_errors.dart';

///Api result=>success,error
///sealed=>to prevent any class from inherit from it ,to close it
sealed class ApiResult<T> {
  ///check the state(type) of the ApiResult
  bool get isSuccess=>this is SuccessApiResult;
  bool get isError=>this is ErrorApiResult;
  ///return data
  T? get getData=>(this as SuccessApiResult).data;
  ///this => object from  ApiResult
  ///as=>cast the object =>the type of the object is SuccessApiResult
  AppErrors get getError=> (this as ErrorApiResult).errorMessage;
}///Parent
class SuccessApiResult<T> extends ApiResult<T>{
  T? data;
  SuccessApiResult({required this.data});
}
class ErrorApiResult<T> extends ApiResult<T>{
  AppErrors errorMessage;
  ErrorApiResult({required this.errorMessage});
}

