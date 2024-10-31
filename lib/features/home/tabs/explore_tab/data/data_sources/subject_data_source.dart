import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/domain/entities/subject_response_entity.dart';


abstract class SubjectDataSource {
  Future<Result<SubjectResponseEntity?>> getSubjects();
}
