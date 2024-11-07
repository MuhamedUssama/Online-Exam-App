import 'package:online_exam_app/core/results/result.dart';

import '../entities/exams_response_entity.dart';

abstract class ExamsRepository {
  Future<Result<ExamsResponseEntity?>> getExamById (String subjectId);
}