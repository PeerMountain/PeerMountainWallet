import 'package:kyc3/app/app.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/initiate-nft-purchase.pb.dart';
import 'package:kyc3/models/hive_adapters/invoices/kyc_invoice.dart';

final invoiceService = InvoiceService.instance;

class InvoiceService {

  InvoiceService._();

  static InvoiceService get instance => InvoiceService._();

  Future<void> addInvoiceToLocalStorage(InitiateNFTPurchaseResponse response) async {
    final invoice = KycInvoice()
      ..nftType = response.nftType
      ..userAddress = response.userAddress
      ..challenge = response.challenge
      ..attestationProvider = response.invoice.attestationProvider
      ..price = response.invoice.price
      ..paymentNonce = response.invoice.paymentNonce.toInt()
      ..cashierAddress = response.invoice.cashierAddress
      ..createAtInMillis = DateTime.now().toUtc().millisecondsSinceEpoch
      ..updatedAtInMillis = DateTime.now().toUtc().millisecondsSinceEpoch
      ..status = "pending";
    await hiveStorage.addInvoiceToLocal(invoice);
  }

  Future<void> updateInvoiceStatus(int paymentNonce, String status) async {
    final invoice = hiveStorage.getAllInvoices()?.firstWhereOrNull(
          (element) => element.paymentNonce == paymentNonce,
        );
    if (invoice != null) {
      invoice.status = status;
      if (status.contains("success")) {
        invoice.purchasedAtInMillis = DateTime.now().toUtc().millisecondsSinceEpoch;
      } else {
        invoice.failedAtInMillis = DateTime.now().toUtc().millisecondsSinceEpoch;
      }
      await hiveStorage.updateInvoiceToLocal(invoice);
    }
  }
}
