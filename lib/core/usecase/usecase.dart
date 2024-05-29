import 'package:open_weather_bloc/core/utils/typedef.dart';

abstract class UseCase<Type, Params> {
  ResultFuture<Type> call({required Params params});
}

abstract class UseCaseNoParams<Type> {
  ResultFuture<Type> call();
}

abstract class UseCaseListener {
  void call();
}
