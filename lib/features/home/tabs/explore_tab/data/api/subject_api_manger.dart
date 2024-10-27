import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/app_constants.dart';
import 'package:online_exam_app/core/networking/api_consumer.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/data/models/subject_response_model.dart';
import '../../../../../../core/cache/shared_preferences.dart';
import '../../../../../../core/networking/end_points.dart';

@singleton
@injectable
class SubjectApiManger {
  ApiConsumer consumer;
  @factoryMethod
  SubjectApiManger(this.consumer);
  Future<SubjectResponseModel> getSubjects() async {
    final String prefs =
        SharedPreferencesHelper.getSecuredString(key: AppConstants.token);
    print('-------------------------');
    print('form subject api token : $prefs');
    final json = await consumer
        .get(EndPoints.subjectUrl, headers: {AppConstants.token: prefs});
    SubjectResponseModel subjectResponse = SubjectResponseModel.fromJson(json);
    return subjectResponse;
  }
}
