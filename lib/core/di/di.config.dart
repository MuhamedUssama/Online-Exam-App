// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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
import '../../features/auth/login_and_signup/data/api/auth_api_manger.dart'
    as _i836;
import '../../features/auth/login_and_signup/data/data_sources/auth_data_source.dart'
    as _i98;
import '../../features/auth/login_and_signup/data/data_sources/auth_data_source_impl.dart'
    as _i385;
import '../../features/auth/login_and_signup/data/repository_impl/auth_repository_impl.dart'
    as _i505;
import '../../features/auth/login_and_signup/domain/repository/auth_repository.dart'
    as _i619;
import '../../features/auth/login_and_signup/domain/usecases/login_usecase.dart'
    as _i384;
import '../../features/auth/login_and_signup/domain/usecases/sign_up_usecase.dart'
    as _i934;
import '../../features/auth/login_and_signup/ui/login/cubit/login_view_model.dart'
    as _i788;
import '../../features/auth/login_and_signup/ui/signUp/cubit/sign_up_view_model.dart'
    as _i479;
import '../../features/exams/data/api/exams_api_manger.dart' as _i423;
import '../../features/exams/data/data_source/exams_data_source.dart' as _i867;
import '../../features/exams/data/data_source/exams_data_source_impl.dart'
    as _i703;
import '../../features/exams/data/repository_impl/exams_repository_impl.dart'
    as _i119;
import '../../features/exams/domain/repository/exams_repository.dart' as _i346;
import '../../features/exams/domain/usecase/exams_usecase.dart' as _i156;
import '../../features/exams/presentation/cubit/exams_view_model.dart' as _i725;
import '../../features/home/home_screen_view_model.dart' as _i296;
import '../../features/home/tabs/explore_tab/data/api/subject_api_manger.dart'
    as _i341;
import '../../features/home/tabs/explore_tab/data/data_sources/subject_data_source.dart'
    as _i303;
import '../../features/home/tabs/explore_tab/data/data_sources/subject_data_source_impl.dart'
    as _i877;
import '../../features/home/tabs/explore_tab/data/repository_impl/subject_repository_impl.dart'
    as _i782;
import '../../features/home/tabs/explore_tab/domain/repository/subject_repository.dart'
    as _i424;
import '../../features/home/tabs/explore_tab/domain/usecases/subject_usecase.dart'
    as _i997;
import '../../features/home/tabs/explore_tab/presentation/cubit/explore_tab_view_model.dart'
    as _i228;
import '../../features/home/tabs/profile_tab/data/api/user_profile_api_manager.dart'
    as _i922;
import '../../features/home/tabs/profile_tab/data/data_sourse/user_profile_data_source.dart'
    as _i959;
import '../../features/home/tabs/profile_tab/data/data_sourse/user_profile_data_sourse_impl.dart'
    as _i995;
import '../../features/home/tabs/profile_tab/data/repository_impl/user_profile_repository_impl.dart'
    as _i697;
import '../../features/home/tabs/profile_tab/domain/repository/user_profile_repository.dart'
    as _i965;
import '../../features/home/tabs/profile_tab/domain/usecases/change_password_usecase.dart'
    as _i265;
import '../../features/home/tabs/profile_tab/domain/usecases/edit_profile_usecase.dart'
    as _i928;
import '../../features/home/tabs/profile_tab/domain/usecases/get_logged_user_info_usecase.dart'
    as _i837;
import '../../features/home/tabs/profile_tab/domain/usecases/logout_usecase.dart'
    as _i268;
import '../../features/home/tabs/profile_tab/presentation/view_models/change_password_view_model.dart/change_password_view_model.dart'
    as _i86;
import '../../features/home/tabs/profile_tab/presentation/view_models/user_profile_view_model/user_profile_view_model.dart'
    as _i422;
import '../../features/question/data/api/questions_api_manger.dart' as _i265;
import '../../features/question/data/data_source/questions_data_source.dart'
    as _i662;
import '../../features/question/data/data_source/questions_data_source_impl.dart'
    as _i328;
import '../../features/question/data/repository_impl/questions_repository_impl.dart'
    as _i608;
import '../../features/question/domain/repository/questions_repository.dart'
    as _i812;
import '../../features/question/domain/usecase/questions_usecase.dart' as _i181;
import '../../features/question/presentation/cubit/questions_view_model.dart'
    as _i213;
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
    gh.factory<_i296.HomeScreenViewModel>(() => _i296.HomeScreenViewModel());
    gh.singleton<_i254.SharedPreferencesHelper>(
        () => _i254.SharedPreferencesHelper());
    gh.factory<_i681.ApiConsumer>(() => _i1042.DioConsumer());
    gh.factory<_i634.ForgetPasswordApiManager>(
        () => _i634.ForgetPasswordApiManager(gh<_i681.ApiConsumer>()));
    gh.singleton<_i836.ApiManger>(
        () => _i836.ApiManger(gh<_i681.ApiConsumer>()));
    gh.factory<_i659.ForgetPasswordDataSource>(() =>
        _i224.ForgetPasswordDataSourceImpl(
            gh<_i634.ForgetPasswordApiManager>()));
    gh.factory<_i503.ForgetPasswordRepository>(() =>
        _i633.ForgetPasswordRepositoryImpl(
            gh<_i659.ForgetPasswordDataSource>()));
    gh.singleton<_i922.UserProfileApiManager>(
        () => _i922.UserProfileApiManager(gh<_i681.ApiConsumer>()));
    gh.singleton<_i341.SubjectApiManger>(
        () => _i341.SubjectApiManger(gh<_i681.ApiConsumer>()));
    gh.singleton<_i423.ExamsApiManger>(
        () => _i423.ExamsApiManger(gh<_i681.ApiConsumer>()));
    gh.singleton<_i265.QuestionsApiManger>(
        () => _i265.QuestionsApiManger(gh<_i681.ApiConsumer>()));
    gh.factory<_i867.ExamsDataSource>(
        () => _i703.ExamsDataSourceImpl(gh<_i423.ExamsApiManger>()));
    gh.factory<_i959.UserProfileDataSource>(() =>
        _i995.UserProfileDataSourseImpl(gh<_i922.UserProfileApiManager>()));
    gh.factory<_i346.ExamsRepository>(
        () => _i119.ExamsRepositoryImpl(gh<_i867.ExamsDataSource>()));
    gh.factory<_i303.SubjectDataSource>(
        () => _i877.SubjectDataSourceImpl(gh<_i341.SubjectApiManger>()));
    gh.factory<_i156.ExamsUsecase>(
        () => _i156.ExamsUsecase(gh<_i346.ExamsRepository>()));
    gh.factory<_i98.AuthDataSource>(
        () => _i385.LoginDataSourceImpl(gh<_i836.ApiManger>()));
    gh.factory<_i725.ExamsViewModel>(
        () => _i725.ExamsViewModel(gh<_i156.ExamsUsecase>()));
    gh.factory<_i995.ForgetPasswordUsecase>(() =>
        _i995.ForgetPasswordUsecase(gh<_i503.ForgetPasswordRepository>()));
    gh.factory<_i510.ResetPasswordUsecase>(
        () => _i510.ResetPasswordUsecase(gh<_i503.ForgetPasswordRepository>()));
    gh.factory<_i833.VerifyEmailUsecase>(
        () => _i833.VerifyEmailUsecase(gh<_i503.ForgetPasswordRepository>()));
    gh.factory<_i619.AuthRepository>(
        () => _i505.AuthRepositoryImpl(gh<_i98.AuthDataSource>()));
    gh.factory<_i662.QuestionsDataSource>(
        () => _i328.QuestionsDataSourceImpl(gh<_i265.QuestionsApiManger>()));
    gh.factory<_i965.UserProfileRepository>(() =>
        _i697.UserProfileRepositoryImpl(gh<_i959.UserProfileDataSource>()));
    gh.factory<_i424.SubjectRepository>(
        () => _i782.SubjectRepositoryImpl(gh<_i303.SubjectDataSource>()));
    gh.factory<_i812.QuestionsRepository>(
        () => _i608.QuestionsRepositoryImpl(gh<_i662.QuestionsDataSource>()));
    gh.factory<_i181.QuestionsUsecase>(
        () => _i181.QuestionsUsecase(gh<_i812.QuestionsRepository>()));
    gh.factory<_i539.ForgetPasswordViewModel>(
        () => _i539.ForgetPasswordViewModel(gh<_i995.ForgetPasswordUsecase>()));
    gh.factory<_i265.ChangePasswordUsecase>(
        () => _i265.ChangePasswordUsecase(gh<_i965.UserProfileRepository>()));
    gh.factory<_i928.EditProfileUsecase>(
        () => _i928.EditProfileUsecase(gh<_i965.UserProfileRepository>()));
    gh.factory<_i837.GetLoggedUserInfoUsecase>(() =>
        _i837.GetLoggedUserInfoUsecase(gh<_i965.UserProfileRepository>()));
    gh.factory<_i268.LogoutUsecase>(
        () => _i268.LogoutUsecase(gh<_i965.UserProfileRepository>()));
    gh.factory<_i997.SubjectUsecase>(
        () => _i997.SubjectUsecase(gh<_i424.SubjectRepository>()));
    gh.factory<_i384.LoginUsecase>(
        () => _i384.LoginUsecase(gh<_i619.AuthRepository>()));
    gh.factory<_i934.SignUpUsecase>(
        () => _i934.SignUpUsecase(gh<_i619.AuthRepository>()));
    gh.factory<_i789.EmailVerificationViewModel>(
        () => _i789.EmailVerificationViewModel(
              gh<_i833.VerifyEmailUsecase>(),
              gh<_i995.ForgetPasswordUsecase>(),
            ));
    gh.factory<_i86.ChangePasswordViewModel>(
        () => _i86.ChangePasswordViewModel(gh<_i265.ChangePasswordUsecase>()));
    gh.factory<_i788.LoginViewModel>(
        () => _i788.LoginViewModel(gh<_i384.LoginUsecase>()));
    gh.factory<_i422.UserProfileViewModel>(() => _i422.UserProfileViewModel(
          gh<_i837.GetLoggedUserInfoUsecase>(),
          gh<_i928.EditProfileUsecase>(),
          gh<_i268.LogoutUsecase>(),
        ));
    gh.factory<_i1005.ResetPasswordViewModel>(
        () => _i1005.ResetPasswordViewModel(gh<_i510.ResetPasswordUsecase>()));
    gh.factory<_i479.SignUpViewModel>(
        () => _i479.SignUpViewModel(gh<_i934.SignUpUsecase>()));
    gh.factory<_i213.QuestionsViewModel>(
        () => _i213.QuestionsViewModel(gh<_i181.QuestionsUsecase>()));
    gh.factory<_i228.ExploreTabViewModel>(
        () => _i228.ExploreTabViewModel(gh<_i997.SubjectUsecase>()));
    return this;
  }
}
