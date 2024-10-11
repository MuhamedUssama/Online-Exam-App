// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/login/data/api/login_api_manger.dart' as _i707;
import '../../features/login/data/data_sources/login_data_source.dart'
    as _i1005;
import '../../features/login/data/data_sources/login_data_source_impl.dart'
    as _i67;
import '../../features/login/data/repository_impl/login_repository_impl.dart'
    as _i816;
import '../../features/login/domain/repository/login_repository.dart' as _i312;
import '../../features/login/domain/usecases/login_usecase.dart' as _i420;
import '../../features/login/ui/cubit/login_view_model.dart' as _i362;
import '../cache/shared_preferences.dart' as _i254;
import '../networking/api_consumer.dart' as _i681;
import '../networking/dio_consumer.dart' as _i1042;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i254.SharedPreferencesHelper>(
        () => _i254.SharedPreferencesHelper());
    gh.factory<_i681.ApiConsumer>(() => _i1042.DioConsumer());
    gh.singleton<_i707.LoginApiManger>(
        () => _i707.LoginApiManger(gh<_i681.ApiConsumer>()));
    gh.factory<_i1005.LoginDataSource>(
        () => _i67.LoginDataSourceImpl(gh<_i707.LoginApiManger>()));
    gh.factory<_i312.LoginRepository>(
        () => _i816.LoginRepositoryImpl(gh<_i1005.LoginDataSource>()));
    gh.factory<_i420.LoginUsecase>(
        () => _i420.LoginUsecase(gh<_i312.LoginRepository>()));
    gh.factory<_i362.LoginViewModel>(
        () => _i362.LoginViewModel(gh<_i420.LoginUsecase>()));
    return this;
  }
}
