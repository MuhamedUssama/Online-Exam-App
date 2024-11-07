import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';
import '../../../../../../../core/errors/exceptions.dart';
import '../../domain/entities/exams_response_entity.dart';
import '../../domain/repository/exams_repository.dart';
import '../data_source/exams_data_source.dart';

@Injectable(as: ExamsRepository)
class ExamsRepositoryImpl extends ExamsRepository {
  ExamsDataSource dataSource;
  @factoryMethod
  ExamsRepositoryImpl(this.dataSource);
  Future<bool> _checkInternetConnection() async {
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());
    return (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi));
  }

  @override
  Future<Result<ExamsResponseEntity?>> getExamById(String subjectId)async {
    if (await _checkInternetConnection()) {
    return dataSource.getExamById(subjectId);
    }
    return Fail(const NoInternetConnectionException());
  }

}
