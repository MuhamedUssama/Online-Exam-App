import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/question/data/data_source/questions_data_source.dart';
import 'package:online_exam_app/features/question/domain/entities/questions_response_entity.dart';
import '../../../../../../../core/errors/exceptions.dart';
import '../../domain/repository/questions_repository.dart';

@Injectable(as: QuestionsRepository)
class QuestionsRepositoryImpl extends QuestionsRepository {
  QuestionsDataSource dataSource;
  @factoryMethod
  QuestionsRepositoryImpl(this.dataSource);
  Future<bool> _checkInternetConnection() async {
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());
    return (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi));
  }

  @override
  Future<Result<QuestionsResponseEntity?>> getQuestionsOnExam(String examId) async{
    if (await _checkInternetConnection()) {
    return dataSource.getQuestionsOnExam(examId);
    }
    return Fail(const NoInternetConnectionException());
  }


}
