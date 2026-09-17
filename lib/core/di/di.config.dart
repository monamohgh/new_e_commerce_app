// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i432;
import '../../features/auth/data/data_sources/remote/auth_remote_data_source_impl.dart'
    as _i299;
import '../../features/auth/data/repositry/auth_repository_impl.dart' as _i614;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/use_cases/login_use_case.dart' as _i1038;
import '../../features/auth/domain/use_cases/register_use_case.dart' as _i1010;
import '../../features/auth/ui/login/cubit/login_cubit.dart' as _i416;
import '../../features/auth/ui/register/cubit/register_cubit.dart' as _i539;
import '../network/api_client.dart' as _i557;
import '../network/get_it_module.dart' as _i601;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.lazySingleton<_i361.BaseOptions>(() => getItModule.baseOptions);
    gh.lazySingleton<_i528.PrettyDioLogger>(() => getItModule.prettyDioLogger);
    gh.lazySingleton<_i557.ApiClient>(() => getItModule.provideApiClient);
    gh.lazySingleton<_i895.Connectivity>(() => getItModule.provideConnectivity);
    gh.factory<_i432.AuthRemoteDataSource>(
      () => _i299.AuthRemoteDataSourceImpl(apiClient: gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.factory<_i961.AuthRepository>(
      () => _i614.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i432.AuthRemoteDataSource>(),
        connectivity: gh<_i895.Connectivity>(),
      ),
    );
    gh.lazySingleton<_i1038.LoginUseCase>(
      () => _i1038.LoginUseCase(authRepository: gh<_i961.AuthRepository>()),
    );
    gh.lazySingleton<_i1010.RegisterUseCase>(
      () => _i1010.RegisterUseCase(authRepository: gh<_i961.AuthRepository>()),
    );
    gh.factory<_i539.RegisterCubit>(
      () => _i539.RegisterCubit(registerUseCase: gh<_i1010.RegisterUseCase>()),
    );
    gh.factory<_i416.LoginCubit>(
      () => _i416.LoginCubit(loginUseCase: gh<_i1038.LoginUseCase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i601.GetItModule {}
