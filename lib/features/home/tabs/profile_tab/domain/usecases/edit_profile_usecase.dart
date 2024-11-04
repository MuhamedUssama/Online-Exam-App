import 'package:injectable/injectable.dart';

import '../../../../../../core/results/result.dart';
import '../entities/user_profile_entity.dart';
import '../repository/user_profile_repository.dart';

@injectable
class EditProfileUsecase {
  UserProfileRepository repository;

  @factoryMethod
  EditProfileUsecase(this.repository);

  Future<Result<UserProfileEntity?>> call({
    String? userName,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) {
    return repository.editProfile(
      email: email,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      userName: userName,
    );
  }
}
