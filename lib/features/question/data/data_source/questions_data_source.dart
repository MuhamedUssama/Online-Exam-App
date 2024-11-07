import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/question/domain/entities/questions_response_entity.dart';

abstract class QuestionsDataSource{
 Future<Result<QuestionsResponseEntity?>> getQuestionsOnExam(String examId);
}
