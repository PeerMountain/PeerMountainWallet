part of 'invoice_cubit.dart';

class InvoiceState extends Equatable {
  const InvoiceState._({
    this.status = CubitState.loading,
    this.items = const <KycContact>[],
  });

  const InvoiceState.loading() : this._();

  const InvoiceState.success(List<KycContact> items) : this._(status: CubitState.success, items: items);

  const InvoiceState.failure() : this._(status: CubitState.failure);

  final CubitState status;
  final List<KycContact> items;

  @override
  List<Object> get props => [status, items];
}
