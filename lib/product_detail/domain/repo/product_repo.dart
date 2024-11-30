import 'package:dio/dio.dart';

abstract class ProductRepo {
  Future<Response> getProductDetail();
}
