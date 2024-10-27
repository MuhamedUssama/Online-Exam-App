import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/results/result.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/data/data_sources/subject_data_source.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/domain/entities/subject_response_entity.dart';
import 'package:online_exam_app/features/home/tabs/explore_tab/domain/repository/subject_repository.dart';

import '../../../../../../core/errors/exceptions.dart';

@Injectable(as: SubjectRepository)
class SubjectRepositoryImpl extends SubjectRepository {
  SubjectDataSource dataSource;
  @factoryMethod
  SubjectRepositoryImpl(this.dataSource);
  Future<bool> _checkInternetConnection() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    return (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi));
  }

  @override
  Future<Result<SubjectResponseEntity>> getSubjects() async {
    if (await _checkInternetConnection()) {
      return dataSource.getSubjects();
    }
    return Fail(const NoInternetConnectionException());
  }
}
