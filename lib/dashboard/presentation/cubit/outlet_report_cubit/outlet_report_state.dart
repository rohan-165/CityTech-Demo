// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'outlet_report_cubit.dart';

abstract class OutletReportState extends Equatable {
  final OutletModel data;
  final ApiStatus apiStatus;
  final FailureState failureState;
  const OutletReportState({
    required this.data,
    required this.apiStatus,
    required this.failureState,
  });

  OutletReportState copyWith({
    OutletModel? data,
    ApiStatus? apiStatus,
    FailureState? failureState,
  }) {
    return OutletReportStateImpl(
      data: data ?? this.data,
      apiStatus: apiStatus ?? this.apiStatus,
      failureState: failureState ?? this.failureState,
    );
  }
}

class OutletReportStateImpl extends OutletReportState {
  const OutletReportStateImpl({
    required super.data,
    required super.apiStatus,
    required super.failureState,
  });
  @override
  OutletReportStateImpl copyWith({
    OutletModel? data,
    ApiStatus? apiStatus,
    FailureState? failureState,
  }) {
    return OutletReportStateImpl(
      data: data ?? this.data,
      apiStatus: apiStatus ?? this.apiStatus,
      failureState: failureState ?? this.failureState,
    );
  }

  @override
  List<Object?> get props => [
        data,
        apiStatus,
        failureState,
      ];
}

class OutletReportStateInitial extends OutletReportStateImpl {
  OutletReportStateInitial()
      : super(
          data: OutletModel(),
          apiStatus: ApiStatus.INITIAL,
          failureState: FailureState(),
        );
}
