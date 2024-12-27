import 'package:dartz/dartz.dart';
import 'package:product/core/service/network_service/failure_state.dart';

typedef DynamicRepo = Either<dynamic, FailureState>;
typedef FutureDynamicRepo = Future<Either<dynamic, FailureState>>;
