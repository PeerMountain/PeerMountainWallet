import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hive/hive.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/hive_adapters/invoices/kyc_invoice.dart';
import 'package:kyc3/ui/main_screen/widgets/item_invoice.dart';
import 'package:kyc3/utils/app_utils.dart';
import 'package:kyc3/widgets/base_scaffold.dart';
import 'package:kyc3/widgets/widgets.dart';
import 'package:provider/src/provider.dart';

import 'invoice_cubit.dart';

class AllInvoicesScreen extends StatefulWidget {
  const AllInvoicesScreen({Key? key}) : super(key: key);

  @override
  _AllInvoicesScreenState createState() => _AllInvoicesScreenState();
}

class _AllInvoicesScreenState extends State<AllInvoicesScreen> {
  @override
  Widget build(BuildContext context) {
    final liveList = context.read<InvoiceCubit>().liveInvoices();
    return BaseScaffold(
      isAppbar: true,
      titleStyle: CustomStyles.appbarTitle,
      backgroundColor: context.homeBackgroundColor,
      title: "Invoices",
      applyShape: true,
      child: liveList == null
          ? const NoDataFound(msg: "No invoices yet!")
          : ValueListenableBuilder<Box<KycInvoice>>(
              valueListenable: liveList,
              builder: (context, box, _) {
                final _invoices = box.values.toList();

                if (_invoices.isEmpty) return const NoDataFound(msg: "No invoices yet!");

                return GroupedListView<KycInvoice, String>(
                  elements: _invoices,

                  /// group by created date
                  groupBy: (element) => Utils.formatMillis(element.createAtInMillis),

                  /// will be used to sort groups
                  groupComparator: (item1, item2) => item2.compareTo(item1),

                  /// will be used to sort items list inside group
                  itemComparator: (item1, item2) =>
                      item2.createAtInMillis!.compareTo(item1.createAtInMillis!),
                  useStickyGroupSeparators: false,
                  groupSeparatorBuilder: (String value) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 16.0, right: 16.0),
                      child: Texts(
                        value,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                  itemBuilder: (_, element) {
                    return ItemInvoice(invoice: element);
                  },
                );
              },
            ),
    );
  }
}
