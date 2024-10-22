// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/login_and_signup/data/api/auth_api_manger.dart'
    as _i257;
import '../../features/auth/login_and_signup/data/data_sources/auth_data_source.dart'
    as _i933;
import '../../features/auth/login_and_signup/data/data_sources/auth_data_source_impl.dart'
    as _i454;
import '../../features/auth/login_and_signup/data/repository_impl/auth_repository_impl.dart'
    as _i954;
import '../../features/auth/login_and_signup/domain/repository/auth_repository.dart'
    as _i961;
import '../../features/auth/login_and_signup/domain/usecases/login_usecase.dart'
    as _i188;
import '../../features/auth/login_and_signup/domain/usecases/sign_up_usecase.dart'
    as _i860;
import '../../features/auth/forget_password/data/api/forget_password_api_manager.dart'
    as _i634;
import '../../features/auth/forget_password/data/data_source/forget_password_data_source.dart'
    as _i659;
import '../../features/auth/forget_password/data/data_source/forget_password_data_source_impl.dart'
    as _i224;
import '../../features/auth/forget_password/data/repository_impl/forget_password_repository_impl.dart'
    as _i633;
import '../../features/auth/forget_password/domain/repository/forget_password_repository.dart'
    as _i503;
import '../../features/auth/forget_password/domain/usecases/forget_password_usecase.dart'
    as _i995;
import '../../features/auth/forget_password/domain/usecases/reset_password_usecase.dart'
    as _i510;
import '../../features/auth/forget_password/domain/usecases/verify_email_usecase.dart'
    as _i833;
import '../../features/auth/forget_password/presentation/view_models/email_verification_view_model/email_verification_view_model.dart'
    as _i789;
import '../../features/auth/forget_password/presentation/view_models/forget_password_view_model/forget_password_view_model.dart'
    as _i539;
import '../../features/auth/forget_password/presentation/view_models/reset_password_view_model/reset_password_view_model.dart'
    as _i1005;
import '../../features/auth/login_and_signup/ui/login/cubit/login_view_model.dart'
    as _i723;
import '../../features/auth/login_and_signup/ui/signUp/cubit/sign_up_view_model.dart'
    as _i371;
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
    gh.factory<_i634.ForgetPasswordApiManager>(
        () => _i634.ForgetPasswordApiManager(gh<_i681.ApiConsumer>()));
    gh.singleton<_i257.ApiManger>(
        () => _i257.ApiManger(gh<_i681.ApiConsumer>()));
    gh.factory<_i659.ForgetPasswordDataSource>(() =>
        _i224.ForgetPasswordDataSourceImpl(
            gh<_i634.ForgetPasswordApiManager>()));
    gh.factory<_i503.ForgetPasswordRepository>(() =>
        _i633.ForgetPasswordRepositoryImpl(
            gh<_i659.ForgetPasswordDataSource>()));
    gh.factory<_i933.AuthDataSource>(
        () => _i454.LoginDataSourceImpl(gh<_i257.ApiManger>()));
    gh.factory<_i961.AuthRepository>(
        () => _i954.AuthRepositoryImpl(gh<_i933.AuthDataSource>()));
    gh.factory<_i995.ForgetPasswordUsecase>(() =>
        _i995.ForgetPasswordUsecase(gh<_i503.ForgetPasswordRepository>()));
    gh.factory<_i510.ResetPasswordUsecase>(
        () => _i510.ResetPasswordUsecase(gh<_i503.ForgetPasswordRepository>()));
    gh.factory<_i833.VerifyEmailUsecase>(
        () => _i833.VerifyEmailUsecase(gh<_i503.ForgetPasswordRepository>()));
    gh.factory<_i539.ForgetPasswordViewModel>(
        () => _i539.ForgetPasswordViewModel(gh<_i995.ForgetPasswordUsecase>()));
    gh.factory<_i789.EmailVerificationViewModel>(
        () => _i789.EmailVerificationViewModel(
              gh<_i833.VerifyEmailUsecase>(),
              gh<_i995.ForgetPasswordUsecase>(),
            ));
    gh.factory<_i188.LoginUsecase>(
        () => _i188.LoginUsecase(gh<_i961.AuthRepository>()));
    gh.factory<_i860.SignUpUsecase>(
        () => _i860.SignUpUsecase(gh<_i961.AuthRepository>()));
    gh.factory<_i1005.ResetPasswordViewModel>(
        () => _i1005.ResetPasswordViewModel(gh<_i510.ResetPasswordUsecase>()));
    gh.factory<_i371.SignUpViewModel>(
        () => _i371.SignUpViewModel(gh<_i860.SignUpUsecase>()));
    gh.factory<_i723.LoginViewModel>(
        () => _i723.LoginViewModel(gh<_i188.LoginUsecase>()));
    return this;
  }
}
