import 'package:dartz/dartz.dart';
import 'package:open_weather_bloc/core/errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultVoid = ResultFuture<void>;
