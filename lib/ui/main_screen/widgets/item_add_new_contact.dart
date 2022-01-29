import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/widgets/widgets.dart';

class ItemAddNewContact extends StatelessWidget {
  final VoidCallback onTap;

  const ItemAddNewContact({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      padding: p10.copyWith(top: 14.0, bottom: 14),
      margin: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      onTap: onTap,
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.person_add,
          color: Colors.white,
        ),
      ),
      title: Container(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Texts(
          Strings.newContact,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16.0),
        ),
      ),
      trailing: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SvgImage(
          Assets.svgBarcode,
          width: 24.0,
        ),
      ),
    );
  }
}
