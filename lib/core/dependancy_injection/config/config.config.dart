// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dev_test/core/dependancy_injection/modules/dio_module.dart'
    as _i11;
import 'package:dev_test/core/network/network_client.dart' as _i5;
import 'package:dev_test/features/authentication/data/datasources/auth_data_source.dart'
    as _i6;
import 'package:dev_test/features/authentication/data/datasources/local_data_source.dart'
    as _i4;
import 'package:dev_test/features/authentication/data/repositories/auth_repositories_impl.dart'
    as _i8;
import 'package:dev_test/features/authentication/domain/repositories/auth_repositories.dart'
    as _i7;
import 'package:dev_test/features/authentication/domain/usecases/login_usecase.dart'
    as _i9;
import 'package:dev_test/features/authentication/presentation/bloc/login_bloc.dart'
    as _i10;
import 'package:dio/dio.dart' as _i3;
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
    final dioModule = _$DioModule();
    gh.lazySingleton<_i3.Dio>(() => dioModule.dioInstance);
    gh.lazySingleton<_i4.LocalDataSource>(() => _i4.LocalDataSourceImpl());
    gh.lazySingleton<_i5.NetworkClient>(() => _i5.NetworkClient(gh<_i3.Dio>()));
    gh.lazySingleton<_i6.AuthDataSource>(() => _i6.AuthDataSourceImpl(
          gh<_i5.NetworkClient>(),
          gh<_i4.LocalDataSource>(),
        ));
    gh.lazySingleton<_i7.AuthRepositories>(
        () => _i8.AuthRepositoriesImpl(gh<_i6.AuthDataSource>()));
    gh.lazySingleton<_i9.LoginUseCase>(
        () => _i9.LoginUseCase(gh<_i7.AuthRepositories>()));
    gh.factory<_i10.LoginBloc>(() => _i10.LoginBloc(gh<_i9.LoginUseCase>()));
    return this;
  }
}

class _$DioModule extends _i11.DioModule {}
