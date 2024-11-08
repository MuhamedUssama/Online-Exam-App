import 'package:injectable/injectable.dart';
import '../../../../../../core/results/result.dart';
import '../entities/logout_entity.dart';
import '../repository/user_profile_repository.dart';

@injectable
class LogoutUsecase {
  UserProfileRepository repository;

  @factoryMethod
  LogoutUsecase(this.repository);

  Future<Result<LogoutEntity?>> call() {
    return repository.logout();
  }
}
