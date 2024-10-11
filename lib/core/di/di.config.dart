// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/forget_password/data/api/forget_password_api_manager.dart'
    as _i617;
import '../../features/forget_password/data/data_source/forget_password_data_source.dart'
    as _i246;
import '../../features/forget_password/data/data_source/forget_password_data_source_impl.dart'
    as _i164;
import '../../features/forget_password/data/repository_impl/forget_password_repository_impl.dart'
    as _i319;
import '../../features/forget_password/domain/repository/forget_password_repository.dart'
    as _i710;
import '../../features/forget_password/domain/usecases/forget_password_usecase.dart'
    as _i535;
import '../../features/forget_password/domain/usecases/reset_password_usecase.dart'
    as _i966;
import '../../features/forget_password/domain/usecases/verify_email_usecase.dart'
    as _i673;
import '../../features/forget_password/presentation/view_models/forget_password_view_model/forget_password_view_model.dart'
    as _i907;
import '../cache/shared_preferences.dart' as _i254;
import '../networking/api_consumer.dart' as _i681;
import '../networking/check_connectivity.dart' as _i91;
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
    gh.singleton<_i91.NetworkInfo>(
        () => _i91.NetworkInfo(gh<_i895.Connectivity>()));
    gh.factory<_i681.ApiConsumer>(() => _i1042.DioConsumer());
    gh.factory<_i617.ForgetPasswordApiManager>(
        () => _i617.ForgetPasswordApiManager(gh<_i681.ApiConsumer>()));
    gh.factory<_i246.ForgetPasswordDataSource>(() =>
        _i164.ForgetPasswordDataSourceImpl(
            gh<_i617.ForgetPasswordApiManager>()));
    gh.factory<_i710.ForgetPasswordRepository>(
        () => _i319.ForgetPasswordRepositoryImpl(
              gh<_i246.ForgetPasswordDataSource>(),
              gh<_i91.NetworkInfo>(),
            ));
    gh.factory<_i535.ForgetPasswordUsecase>(() =>
        _i535.ForgetPasswordUsecase(gh<_i710.ForgetPasswordRepository>()));
    gh.factory<_i673.VerifyEmailUsecase>(
        () => _i673.VerifyEmailUsecase(gh<_i710.ForgetPasswordRepository>()));
    gh.factory<_i966.ResetPasswordUsecase>(
        () => _i966.ResetPasswordUsecase(gh<_i710.ForgetPasswordRepository>()));
    gh.factory<_i907.ForgetPasswordViewModel>(
        () => _i907.ForgetPasswordViewModel(gh<_i535.ForgetPasswordUsecase>()));
    return this;
  }
}
