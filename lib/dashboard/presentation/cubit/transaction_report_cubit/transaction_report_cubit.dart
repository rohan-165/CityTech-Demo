import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/core/service/network_service/failure_state.dart';
import 'package:product/core/service/service_locator.dart';
import 'package:product/core/utils/enum.dart';
import 'package:product/core/utils/typedef.dart';
import 'package:product/dashboard/domain/model/transaction_report_model.dart';
import 'package:equatable/equatable.dart';
import 'package:product/dashboard/domain/repo/product_repo.dart';

part 'transaction_report_state.dart';

class TransactionReportCubit extends Cubit<TransactionReportState> {
  TransactionReportCubit() : super(TransactionReportStateInitial());

  void reset() {
    emit(TransactionReportStateInitial());
  }

  void getTransactionReport() async {
    emit(state.copyWith(apiStatus: ApiStatus.LOADING));

    // Simulate API call
    DynamicRepo resp = await getIt<DashBoardRepo>().getTransactionReport();

    resp.fold((l) {
      if (l.containsKey('data') && l['data'] != null) {
        // Parse and emit success if 'data' exists and is not null
        try {
          TransactionModel model = TransactionModel.fromJson(l['data']);
          emit(
            state.copyWith(
              apiStatus: ApiStatus.SUCCESS,
              data: model,
            ),
          );
        } catch (e) {
          // Handle parsing error or invalid data format
          emit(
            state.copyWith(
              apiStatus: ApiStatus.FAILURE,
              failureState:
                  FailureState(message: "Invalid data format: ${e.toString()}"),
            ),
          );
        }
      } else {
        // Handle missing or null 'data'
        emit(
          state.copyWith(
            apiStatus: ApiStatus.SUCCESS,
            failureState: FailureState(message: "Data not found or is null."),
          ),
        );
      }
    },
        (r) => emit(
              state.copyWith(
                apiStatus: ApiStatus.FAILURE,
                failureState: r,
              ),
            ));
  }
}
