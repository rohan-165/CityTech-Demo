import 'package:dio/dio.dart';
import 'package:product/product_detail/domain/repo/product_repo.dart';

interface class ApiEndpoint {
  String endPoint =
      'https://oriflamenepal.com/api/product/for-public/smart-sync-lipstick-233'; // dummy endpoint
}

class ProductRepoImpl extends ProductRepo {
  ApiEndpoint get _api => ApiEndpoint();
  final Dio _dio = Dio();
  @override
  Future<Response> getProductDetail() async {
    Response resp = await _dio.get(_api.endPoint);
    return resp;
  }
}
