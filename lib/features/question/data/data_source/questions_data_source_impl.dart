
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/question/data/api/questions_api_manger.dart';
import 'package:online_exam_app/features/question/data/data_source/questions_data_source.dart';
import 'package:online_exam_app/features/question/domain/entities/questions_response_entity.dart';
import '../../../../../../../core/errors/exceptions.dart';
import '../../../../../../../core/utils/app_strings.dart';

@Injectable(as: QuestionsDataSource)
class QuestionsDataSourceImpl extends QuestionsDataSource {
  QuestionsApiManger apiManger;
  @factoryMethod
  QuestionsDataSourceImpl(this.apiManger);

  @override
  Future<Result<QuestionsResponseEntity?>> getQuestionsOnExam(String examId)async {
    final result = await apiManger.getQuestionsOnExam(examId);
    if (result.message == 'success') {
      return Success(result.toQuestionsResponseEntity());
    } else {
      return Fail(ServerException(
        result.message ?? AppStrings.somethingWentWrong,
      ));
    }
  }



}
