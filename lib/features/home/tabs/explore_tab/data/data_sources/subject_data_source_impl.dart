import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/data/api/subject_api_manger.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/data/data_sources/subject_data_source.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/domain/entities/subject_response_entity.dart';

import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/utils/app_strings.dart';

@Injectable(as: SubjectDataSource)
class SubjectDataSourceImpl extends SubjectDataSource {
  SubjectApiManger apiManger;
  @factoryMethod
  SubjectDataSourceImpl(this.apiManger);

  @override
  Future<Result<SubjectResponseEntity?>> getSubjects() async {
    final result = await apiManger.getSubjects();
    if (result.message == 'success') {
      return Success(result.toSubjectResponseEntity());
    } else {
      return Fail(ServerException(
        result.message ?? AppStrings.somethingWentWrong,
      ));
    }
  }
}
