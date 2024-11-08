import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/domain/entities/subject_response_entity.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/domain/usecases/subject_usecase.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/presentation/cubit/explore_tab_actions.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/presentation/cubit/explore_tab_states.dart';


@injectable
class ExploreTabViewModel extends Cubit<ExploreTabStates> {
  SubjectUsecase usecase;
  @factoryMethod
  ExploreTabViewModel(this.usecase) : super(ExploreTabInitialState());
  void doIntent({required ExploreTabActions action}) {
    switch (action) {
      case ExploreTabIntent():
        _getSubject();
    }
  }

  Future<void> _getSubject() async {
    emit(ExploreTabLoadingState());
    final result = await usecase.invoke();
    switch (result) {
      case Success<SubjectResponseEntity?>():
        {
          emit(ExploreTabSuccessState(result.data));
        }
      case Fail<SubjectResponseEntity?>():
        emit(ExploreTabErrorState(result.exception?.message ?? ""));
    }
  }
}
