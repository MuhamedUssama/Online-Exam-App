import 'package:online_exam_app/core/errors/exceptions.dart';

import '../results/result.dart';

Future<Result<T>> executeApi<T>(Future<T>  Function() apiCall)async{
  try{
    var result = await apiCall.call();
    return Success(result);
  }on ServerException catch(ex){
    return Fail(ex);
  }

}