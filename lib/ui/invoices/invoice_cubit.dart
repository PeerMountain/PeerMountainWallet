import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/hive_adapters/contact/kyc_contact.dart';
import 'package:kyc3/models/hive_adapters/invoices/kyc_invoice.dart';
import 'package:kyc3/utils/export_utils.dart';

part 'invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  InvoiceCubit() : super(const InvoiceState.loading());

  ValueListenable<Box<KycInvoice>>? _invoicesListen;

  ValueListenable<Box<KycInvoice>>? liveInvoices() {
    _invoicesListen ??= hiveStorage.liveInvoices();
    return _invoicesListen;
  }
}
