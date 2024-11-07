import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';
import '../../../../../../../core/errors/exceptions.dart';
import '../../../../../../../core/utils/app_strings.dart';
import '../../domain/entities/exams_response_entity.dart';
import '../api/exams_api_manger.dart';
import 'exams_data_source.dart';

@Injectable(as: ExamsDataSource)
class ExamsDataSourceImpl extends ExamsDataSource {
  ExamsApiManger apiManger;
  @factoryMethod
  ExamsDataSourceImpl(this.apiManger);

  @override
  Future<Result<ExamsResponseEntity?>> getExamById(String subjectId)async {
    final result = await apiManger.getExamsById(subjectId);
    if (result.message == 'success') {
      return Success(result.toExamsResponseEntity());
    } else {
      return Fail(ServerException(
        result.message ?? AppStrings.somethingWentWrong,
      ));
    }
  }


}
