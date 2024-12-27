import 'package:product/core/utils/typedef.dart';

abstract class DashBoardRepo {
  FutureDynamicRepo getTransactionReport();

  FutureDynamicRepo getOutLetReport();
}
