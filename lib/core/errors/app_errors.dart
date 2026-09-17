 abstract class  AppErrors {
  String error;
  AppErrors({required this.error});
}
class ServerError extends AppErrors{
ServerError({String message='Server is down please try again later.'}):super(error:message );
}
class NetworkError extends AppErrors{
  NetworkError({String message='No Internet connection please check Internet'}):super(error:message );
}
class IgnoredError extends AppErrors{
  IgnoredError({String message=''}):super(error:message );
}
class UnKnownError extends AppErrors{
  UnKnownError({String message='Something went wrong please try again later'}):super(error:message );
}