

import '../../domain/entities/exams_response_entity.dart';

sealed class ExamsStates {}

class ExamsLoadingState extends ExamsStates {}

class ExamsInitialState extends ExamsStates {}

class ExamsErrorState extends ExamsStates {
  String? errorMessage;
  ExamsErrorState(this.errorMessage);
}

class ExamsSuccessState extends ExamsStates {
  ExamsResponseEntity? entity;
  ExamsSuccessState(this.entity);
}
