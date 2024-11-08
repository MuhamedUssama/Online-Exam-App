import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/question/data/models/questions_response_model.dart';

import '../../../../../../../core/networking/api_consumer.dart';

@singleton
@injectable
class QuestionsApiManger {
  ApiConsumer consumer;
  @factoryMethod
  QuestionsApiManger(this.consumer);
  Future<QuestionsResponseModel> getQuestionsOnExam(String examId) async {
    final json = await consumer
        .get('https://exam.elevateegy.com/api/v1/questions?exam=$examId');
    QuestionsResponseModel questionsResponse = QuestionsResponseModel.fromJson(json);
    return questionsResponse;
  }
}