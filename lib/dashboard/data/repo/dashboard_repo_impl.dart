import 'package:product/core/service/network_service/api_request.dart';
import 'package:product/core/service/service_locator.dart';
import 'package:product/core/utils/typedef.dart';
import 'package:product/dashboard/domain/repo/product_repo.dart';

interface class ApiEndpoint {
  String trasactionReport = '/report/transaction';
  String outletReport = '/report/outlet';
}

class DashBoardRepoImpl extends DashBoardRepo {
  static ApiEndpoint get _endPoint => ApiEndpoint();

  @override
  FutureDynamicRepo getTransactionReport() async {
    return getIt<ApiRequest>().getResponse(
      endPoint: _endPoint.trasactionReport,
      apiMethods: ApiMethods.post,
    );
  }

  @override
  FutureDynamicRepo getOutLetReport() async {
    return getIt<ApiRequest>().getResponse(
      endPoint: _endPoint.outletReport,
      apiMethods: ApiMethods.post,
    );
  }
}
