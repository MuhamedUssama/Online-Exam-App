import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/cache/shared_preferences.dart';
import 'package:online_exam_app/core/results/result.dart';

import '../../domain/entities/exams_response_entity.dart';
import '../../domain/usecase/exams_usecase.dart';
import 'exams_actions.dart';
import 'exams_states.dart';



@injectable
class ExamsViewModel extends Cubit<ExamsStates> {
  ExamsUsecase usecase;
  @factoryMethod
  ExamsViewModel(this.usecase) : super(ExamsInitialState());
  void doIntent({required ExamsActions action}) {
    switch (action) {
      case ExamsIntent():
        _getSubject();
    }
  }

  Future<void> _getSubject() async {
    emit(ExamsLoadingState());
    final result = await usecase.invoke(SharedPreferencesHelper.getString(key: 'subject'));
    switch (result) {
      case Success<ExamsResponseEntity?>():
        {
          emit(ExamsSuccessState(result.data));
        }
      case Fail<ExamsResponseEntity?>():
        emit(ExamsErrorState(result.exception?.message ?? ""));
    }
  }
}
