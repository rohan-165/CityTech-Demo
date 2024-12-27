// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'transaction_report_cubit.dart';

abstract class TransactionReportState extends Equatable {
  final TransactionModel data;
  final ApiStatus apiStatus;
  final FailureState failureState;
  const TransactionReportState({
    required this.data,
    required this.apiStatus,
    required this.failureState,
  });

  TransactionReportState copyWith({
    TransactionModel? data,
    ApiStatus? apiStatus,
    FailureState? failureState,
  }) {
    return TransactionReportStateImpl(
      data: data ?? this.data,
      apiStatus: apiStatus ?? this.apiStatus,
      failureState: failureState ?? this.failureState,
    );
  }
}

class TransactionReportStateImpl extends TransactionReportState {
  const TransactionReportStateImpl({
    required super.data,
    required super.apiStatus,
    required super.failureState,
  });
  @override
  TransactionReportStateImpl copyWith({
    TransactionModel? data,
    ApiStatus? apiStatus,
    FailureState? failureState,
  }) {
    return TransactionReportStateImpl(
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

class TransactionReportStateInitial extends TransactionReportStateImpl {
  TransactionReportStateInitial()
      : super(
          data: TransactionModel(),
          apiStatus: ApiStatus.INITIAL,
          failureState: FailureState(),
        );
}
