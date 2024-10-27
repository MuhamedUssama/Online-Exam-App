import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/domain/entities/subject_response_entity.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/domain/repository/subject_repository.dart';

@injectable
class SubjectUsecase {
  SubjectRepository repository;
  @factoryMethod
  SubjectUsecase(this.repository);
  Future<Result<SubjectResponseEntity>> invoke() async {
    final response = await repository.getSubjects();
    return response;
  }
}
