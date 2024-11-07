import 'package:online_exam_app/core/results/result.dart';

import '../../domain/entities/exams_response_entity.dart';

abstract class ExamsDataSource {
  Future<Result<ExamsResponseEntity?>> getExamById (String subjectId);
}