import '../../../domain/entities/logout_entity.dart';
import '../../../domain/entities/user_profile_entity.dart';

sealed class UserProfileStates {}

class UserProfileInitialState extends UserProfileStates {}

class UserProfileGetInfoLoadingState extends UserProfileStates {
  String? message;
  UserProfileGetInfoLoadingState(this.message);
}

class UserProfileUpdateInfoLoadingState extends UserProfileStates {
  String? message;
  UserProfileUpdateInfoLoadingState(this.message);
}

class UserProfileLogoutLoadingState extends UserProfileStates {
  String? message;
  UserProfileLogoutLoadingState(this.message);
}

class UserProfileGetInfoErrorState extends UserProfileStates {
  String? message;
  UserProfileGetInfoErrorState(this.message);
}

class UserProfileUpdateInfoErrorState extends UserProfileStates {
  String? message;
  UserProfileUpdateInfoErrorState(this.message);
}

class UserProfileLogoutErrorState extends UserProfileStates {
  String? message;
  UserProfileLogoutErrorState(this.message);
}

class GetLoggedUserDataSuccessState extends UserProfileStates {
  UserProfileEntity? loggedUserData;
  GetLoggedUserDataSuccessState(this.loggedUserData);
}

class EditProfileSuccessState extends UserProfileStates {
  UserProfileEntity? editedUserData;
  EditProfileSuccessState(this.editedUserData);
}

class LogoutSuccessState extends UserProfileStates {
  LogoutEntity? logoutEntity;

  LogoutSuccessState(this.logoutEntity);
}
