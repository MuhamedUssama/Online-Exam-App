import 'package:injectable/injectable.dart';

import '../../../../../../core/results/result.dart';
import '../entities/user_profile_entity.dart';
import '../repository/user_profile_repository.dart';

@injectable
class GetLoggedUserInfoUsecase {
  UserProfileRepository repository;

  @factoryMethod
  GetLoggedUserInfoUsecase(this.repository);

  Future<Result<UserProfileEntity?>> call() {
    return repository.getLoggedUserInfo();
  }
}
