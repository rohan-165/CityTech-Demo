import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/product_detail/domain/model/cart_model.dart';

class CartItemCubit extends Cubit<List<CartModel>> {
  CartItemCubit() : super([]);

  void addItem({required CartModel item}) {
    // Create a copy of the current state to work with
    List<CartModel> list = [...state];

    // Flag to check if the item exists
    bool itemExists = false;

    // Iterate through the list to find a matching product code
    for (var i = 0; i < list.length; i++) {
      if (list[i].productCode == item.productCode) {
        // If found, update the quantity
        list[i].quantity = (list[i].quantity ?? 0) + (item.quantity ?? 0);
        itemExists = true;
        break;
      }
    }

    // If the item doesn't exist, add it to the list
    if (!itemExists) {
      list.add(item);
    }

    // Update the state with the modified list
    emit(list);
  }

  void addQuantity({required CartModel item}) {
    // Create a copy of the current state to work with
    List<CartModel> list = [...state];

    // Iterate through the list to find the matching product
    for (var i in list) {
      if (i.productCode == item.productCode) {
        // If a match is found, update the quantity
        i.quantity = (i.quantity ?? 0) + 1;
        break; // Exit the loop once the product is updated
      }
    }

    // Update the state with the modified list
    emit(list);
  }

  void subQuantity({required CartModel item}) {
    // Create a copy of the current state to work with
    List<CartModel> list = [...state];

    // Iterate through the list to find the matching product
    for (var i in list) {
      if (i.productCode == item.productCode) {
        // If a match is found, update the quantity
        i.quantity = (i.quantity ?? 0) - 1;
        break; // Exit the loop once the product is updated
      }
    }

    // Update the state with the modified list
    emit(list);
  }

  void removeQuantity({required CartModel item}) {
    // Create a copy of the current state to work with
    List<CartModel> list = [...state];

    // Remove the item with the matching product code
    list.removeWhere((e) => e.productCode == item.productCode);

    // Update the state with the modified list
    emit(list);
  }
}
