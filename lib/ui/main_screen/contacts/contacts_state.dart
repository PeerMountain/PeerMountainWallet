part of 'contacts_cubit.dart';

class ContactsState extends Equatable {
  const ContactsState._({
    this.status = CubitState.loading,
    this.items = const <KycContact>[],
  });

  const ContactsState.loading() : this._();

  const ContactsState.success(List<KycContact> items) : this._(status: CubitState.success, items: items);

  const ContactsState.failure() : this._(status: CubitState.failure);

  final CubitState status;
  final List<KycContact> items;

  @override
  List<Object> get props => [status, items];
}
