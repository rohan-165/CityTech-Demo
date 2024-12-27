import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:product/core/service/network_service/failure_state.dart';
import 'package:product/core/utils/typedef.dart';

import 'api_manager.dart';

enum ApiMethods { get, post, delete }

abstract class ApiRequest {
  late ApiManager _apiManager;

  void setApiManager(ApiManager apiManager);

  ApiManager get apiManager;

  FutureDynamicRepo decodeHttpRequestResponse(
    Response? response, {
    String message = "",
  });

  FutureDynamicRepo getResponse({
    required String endPoint,
    required ApiMethods apiMethods,
    Map<String, dynamic>? queryParams,
    dynamic body,
    Options? options,
    String? errorMessage,
  });
}

class ApiRequestImpl implements ApiRequest {
  @override
  late ApiManager _apiManager;

  @override
  FutureDynamicRepo decodeHttpRequestResponse(Response? response,
      {String message = ""}) async {
    List<int> successStatusCode = [200, 201];
    if (successStatusCode.contains(response?.statusCode)) {
      return Left({'data': response?.data, 'message': message});
    } else if (response?.statusCode == 500) {
      Fluttertoast.showToast(
        msg: 'Server Error',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
      );
      return Left(response?.data);
    } else if (response?.statusCode == 401) {
      Fluttertoast.showToast(
        msg: 'Unauthorized',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
      );
    } else if (response?.statusCode == 400) {
      return Right(FailureState.fromJson(response!.data));
    } else if (response?.statusCode == 422) {
      return Right(FailureState.fromJson(response!.data));
    } else if (response?.data == null) {
      return Right(response?.data);
    } else {
      return Right(FailureState(message: 'Something went wrong'));
    }
    return response?.data;
  }

  @override
  ApiManager get apiManager => _apiManager;

  @override
  FutureDynamicRepo getResponse(
      {required String endPoint,
      required ApiMethods apiMethods,
      Map<String, dynamic>? queryParams,
      body,
      Options? options,
      String? errorMessage}) async {
    Response? response;
    try {
      if (apiMethods == ApiMethods.post) {
        response = await apiManager.dio!.post(
          endPoint,
          data: body,
          queryParameters: queryParams,
          options: options,
        );
      } else if (apiMethods == ApiMethods.delete) {
        response = await apiManager.dio!.delete(
          endPoint,
          data: body,
          queryParameters: queryParams,
          options: options,
        );
      } else {
        response = await apiManager.dio!
            .get(endPoint, queryParameters: queryParams, options: options);
      }

      return decodeHttpRequestResponse(
        response,
        message: errorMessage ?? "",
      );
    } catch (e) {
      return Right(
          FailureState(message: errorMessage ?? 'Something went wrong'));
    }
  }

  @override
  void setApiManager(ApiManager apiManager) {
    _apiManager = apiManager;
  }
}
