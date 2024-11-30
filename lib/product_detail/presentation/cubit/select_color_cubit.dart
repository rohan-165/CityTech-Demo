import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/product_detail/domain/model/product_detail_model.dart';

class SelectColorCubit extends Cubit<ColorVariants> {
  SelectColorCubit() : super(ColorVariants());

  void selectColor({required ColorVariants color}) {
    emit(color);
  }
}
