import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/cache/shared_preferences.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/question/domain/usecase/questions_usecase.dart';

import '../../domain/entities/questions_response_entity.dart';
import 'questions_actions.dart';
import 'questions_states.dart';



@injectable
class QuestionsViewModel extends Cubit<QuestionsStates> {
  QuestionsUsecase usecase;
  @factoryMethod
  QuestionsViewModel(this.usecase) : super(QuestionsInitialState());
  void doIntent({required QuestionsActions action}) {
    switch (action) {
      case QuestionsIntent():
        _getSubject();
    }
  }

  Future<void> _getSubject() async {
    emit(QuestionsLoadingState());
    final result = await usecase.invoke(SharedPreferencesHelper.getString(key: 'examId'));
    switch (result) {
      case Success<QuestionsResponseEntity?>():
        {
          emit(QuestionsSuccessState(result.data));
        }
      case Fail<QuestionsResponseEntity?>():
        emit(QuestionsErrorState(result.exception?.message ?? ""));
    }
  }
}
