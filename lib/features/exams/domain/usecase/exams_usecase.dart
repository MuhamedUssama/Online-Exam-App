import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';

import '../entities/exams_response_entity.dart';
import '../repository/exams_repository.dart';

@injectable
class ExamsUsecase {
  ExamsRepository repository;
  @factoryMethod
  ExamsUsecase(this.repository);
  Future<Result<ExamsResponseEntity?>> invoke(String subjectId) async {
    final response = await repository.getExamById(subjectId);
    return response;
  }
}
