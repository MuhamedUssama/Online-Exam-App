import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/networking/api_consumer.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/data/models/subject_response_model.dart';
import '../../../../../../core/networking/end_points.dart';

@singleton
@injectable
class SubjectApiManger {
  ApiConsumer consumer;
  @factoryMethod
  SubjectApiManger(this.consumer);
  Future<SubjectResponseModel> getSubjects() async {
    final json = await consumer
        .get(EndPoints.subjectUrl,);
    SubjectResponseModel subjectResponse = SubjectResponseModel.fromJson(json);
    return subjectResponse;
  }
}
