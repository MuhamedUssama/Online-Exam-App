import 'package:online_exam_app/features/home/tabs/explore_tab/domain/entities/subject_response_entity.dart';

sealed class ExploreTabStates {}

class ExploreTabLoadingState extends ExploreTabStates {}

class ExploreTabInitialState extends ExploreTabStates {}

class ExploreTabErrorState extends ExploreTabStates {
  String? errorMessage;
  ExploreTabErrorState(this.errorMessage);
}

class ExploreTabSuccessState extends ExploreTabStates {
  SubjectResponseEntity? entity;
  ExploreTabSuccessState(this.entity);
}
