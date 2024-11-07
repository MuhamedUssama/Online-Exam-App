import 'package:injectable/injectable.dart';

import '../../../../../../../core/networking/api_consumer.dart';
import '../models/exams_response_model.dart';

@singleton
@injectable
class ExamsApiManger {
  ApiConsumer consumer;
  @factoryMethod
  ExamsApiManger(this.consumer);
  Future<ExamsResponseModel> getExamsById(String subjectId) async {
    final json = await consumer
        .get('https://exam.elevateegy.com/api/v1/exams?subject=$subjectId');
    ExamsResponseModel examsResponse = ExamsResponseModel.fromJson(json);
    return examsResponse;
  }
}