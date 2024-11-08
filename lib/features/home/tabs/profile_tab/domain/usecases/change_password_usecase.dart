import 'package:injectable/injectable.dart';

import '../../../../../../core/results/result.dart';
import '../entities/change_password_entity.dart';
import '../repository/user_profile_repository.dart';

@injectable
class ChangePasswordUsecase {
  UserProfileRepository repository;

  @factoryMethod
  ChangePasswordUsecase(this.repository);

  Future<Result<ChangePasswordEntity?>> call({
    String? oldPassword,
    String? newPassword,
    String? rePassword,
  }) {
    return repository.changePassword(
      newPassword: newPassword,
      oldPassword: oldPassword,
      rePassword: rePassword,
    );
  }
}
