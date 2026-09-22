import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:new_e_commerce_app/features/network/api/api_client.dart';
import 'package:new_e_commerce_app/features/network/api/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
//في حزمة Injectable (المستخدمة لترتيب الحقن والاعتماديات Dependency Injection مع get_it في Flutter)/
// ، يُستخدم المُعرّف @module لتسجيل وحقن الفئات (Classes) التي لا تملك الكود المصدري الخاص بها (Third-party dependencies)
// ، مما يعني أنك لا تستطيع كتابة التوضيح @injectable أو @singleton فوقها مباشرة.
// أبرز الأمثلة على ذلك هي الحزم الخارجية التي تستخدمها في مشاريعك مثل Dio، أو http، أو خدمات FirebaseAuth، أو SharedPreferences.
@module
abstract class  GetItModule{
  //todo:ApiClient=>Object Dio
 // todo:Dio=>BaseOptions,PrettyDioLogger(),Interceptors
  //todo:Object Connectivity
  ///I cant make object from Connectivity and Dio because i don't have access to it so we use module
  @LazySingleton()
  BaseOptions get baseOptions=>BaseOptions(
    baseUrl:ApiConstants.baseUrl,
    sendTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 5)
  );
  @LazySingleton()
  PrettyDioLogger get prettyDioLogger=>PrettyDioLogger(
       requestHeader : true,
       requestBody : true,
       responseHeader : true
  );
  @LazySingleton()
  Dio provideDio(BaseOptions baseOptions,PrettyDioLogger prettyDioLogger){
    final dio=Dio(baseOptions);
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }
  @LazySingleton()
  ApiClient get provideApiClient=>ApiClient(provideDio(baseOptions, prettyDioLogger));
  @LazySingleton()
  Connectivity get provideConnectivity=>Connectivity();
}