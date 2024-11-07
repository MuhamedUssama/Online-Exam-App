import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/question/domain/entities/questions_response_entity.dart';
import 'package:online_exam_app/features/question/domain/repository/questions_repository.dart';


@injectable
class QuestionsUsecase {
  QuestionsRepository repository;
  @factoryMethod
  QuestionsUsecase(this.repository);
  Future<Result<QuestionsResponseEntity?>> invoke(String examId) async {
    final response = await repository.getQuestionsOnExam(examId);
    return response;
  }
}
