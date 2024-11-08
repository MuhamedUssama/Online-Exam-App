

import 'package:online_exam_app/features/question/domain/entities/questions_response_entity.dart';


sealed class QuestionsStates {}

class QuestionsLoadingState extends QuestionsStates {}

class QuestionsInitialState extends QuestionsStates {}

class QuestionsErrorState extends QuestionsStates {
  String? errorMessage;
  QuestionsErrorState(this.errorMessage);
}

class QuestionsSuccessState extends QuestionsStates {
  QuestionsResponseEntity? entity;
  QuestionsSuccessState(this.entity);
}
