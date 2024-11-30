import 'package:flutter/material.dart';
import 'package:product/core/route/routes.dart';
import 'package:product/product_detail/presentation/screen/cart_screen.dart';
import 'package:product/product_detail/presentation/screen/product_detail_screen.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    Object? argument = settings.arguments;

    switch (settings.name) {
      case Routes.productDetailScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ProductDetailScreen(),
        );
      case Routes.cartScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CartScreen(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => const ProductDetailScreen(),
        );
    }
  }
}
