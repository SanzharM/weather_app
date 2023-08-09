import 'package:dartz/dartz.dart';
import 'package:weather_app/src/common/usecase/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call({Params? params});
}
