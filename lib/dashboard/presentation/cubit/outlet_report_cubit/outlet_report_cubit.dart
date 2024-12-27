import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/core/service/network_service/failure_state.dart';
import 'package:product/core/service/service_locator.dart';
import 'package:product/core/utils/enum.dart';
import 'package:product/core/utils/typedef.dart';
import 'package:product/dashboard/domain/model/outlet_report_model.dart';
import 'package:product/dashboard/domain/repo/product_repo.dart';

part 'outlet_report_state.dart';

class OutletReportCubit extends Cubit<OutletReportState> {
  OutletReportCubit() : super(OutletReportStateInitial());

  void reset() {
    emit(OutletReportStateInitial());
  }

  void getOutletReport() async {
    emit(state.copyWith(apiStatus: ApiStatus.LOADING));

    // Simulate API call
    DynamicRepo resp = await getIt<DashBoardRepo>().getOutLetReport();

    resp.fold((l) {
      if (l.containsKey('data') && l['data'] != null) {
        // Parse and emit success if 'data' exists and is not null
        try {
          OutletModel model = OutletModel.fromJson(l['data']);
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
