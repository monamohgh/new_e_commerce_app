///Api result=>success,error
///sealed=>to prevent any class from inherit from it ,to close it
sealed class ApiResult<T> {
  ///check the state(type) of the ApiResult
  bool get isSuccess=>this is SuccessApiResult;
}///Parent
class SuccessApiResult<T> extends ApiResult<T>{
  T? data;
  SuccessApiResult({required this.data});
}
class ErrorApiResult<T> extends ApiResult<T>{
  Stream errorMessage;
  ErrorApiResult({required this.errorMessage});
}

