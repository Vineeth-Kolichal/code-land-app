// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dev_test/core/dependancy_injection/modules/cookie_module.dart'
    as _i12;
import 'package:dev_test/core/dependancy_injection/modules/dio_module.dart'
    as _i13;
import 'package:dev_test/core/network/network_client.dart' as _i6;
import 'package:dev_test/features/authentication/data/datasources/auth_data_source.dart'
    as _i7;
import 'package:dev_test/features/authentication/data/datasources/local_data_source.dart'
    as _i5;
import 'package:dev_test/features/authentication/data/repositories/auth_repositories_impl.dart'
    as _i9;
import 'package:dev_test/features/authentication/domain/repositories/auth_repositories.dart'
    as _i8;
import 'package:dev_test/features/authentication/domain/usecases/login_usecase.dart'
    as _i10;
import 'package:dev_test/features/authentication/presentation/bloc/login_bloc.dart'
    as _i11;
import 'package:dio/dio.dart' as _i4;
import 'package:dio_cookie_manager/dio_cookie_manager.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final cookieModule = _$CookieModule();
    final dioModule = _$DioModule();
    gh.lazySingleton<_i3.CookieManager>(() => cookieModule.cookieManager);
    gh.lazySingleton<_i4.Dio>(() => dioModule.dioInstance);
    gh.lazySingleton<_i5.LocalDataSource>(() => _i5.LocalDataSourceImpl());
    gh.lazySingleton<_i6.NetworkClient>(() => _i6.NetworkClient(
          gh<_i4.Dio>(),
          gh<_i3.CookieManager>(),
        ));
    gh.lazySingleton<_i7.AuthDataSource>(() => _i7.AuthDataSourceImpl(
          gh<_i6.NetworkClient>(),
          gh<_i5.LocalDataSource>(),
        ));
    gh.lazySingleton<_i8.AuthRepositories>(
        () => _i9.AuthRepositoriesImpl(gh<_i7.AuthDataSource>()));
    gh.lazySingleton<_i10.LoginUseCase>(
        () => _i10.LoginUseCase(gh<_i8.AuthRepositories>()));
    gh.factory<_i11.LoginBloc>(() => _i11.LoginBloc(gh<_i10.LoginUseCase>()));
    return this;
  }
}

class _$CookieModule extends _i12.CookieModule {}

class _$DioModule extends _i13.DioModule {}
