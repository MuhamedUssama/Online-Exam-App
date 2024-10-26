import '../../../domain/entities/logout_entity.dart';
import '../../../domain/entities/user_profile_entity.dart';

sealed class UserProfileStates {}

class UserProfileInitialState extends UserProfileStates {}

class UserProfileLoadingState extends UserProfileStates {
  String? message;
  UserProfileLoadingState(this.message);
}

class UserProfileErrorState extends UserProfileStates {
  String? message;
  UserProfileErrorState(this.message);
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
  LogoutEntity logoutEntity;

  LogoutSuccessState(this.logoutEntity);
}
