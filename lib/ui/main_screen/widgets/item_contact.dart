import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/hive_adapters/contact/kyc_contact.dart';
import 'package:kyc3/widgets/cached_image.dart';
import 'package:kyc3/widgets/widgets.dart';

class ItemContact extends StatelessWidget {
  final KycContact contact;

  const ItemContact({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = CustomListTile(
      padding: p10.copyWith(top: 14.0, bottom: 14),
      margin: EdgeInsets.zero,
      leading: contact.image != null && contact.image?.isNotEmpty == true
          ? CachedImage(
              contact.image,
              isLocal: true,
              isRound: true,
              radius: 50,
            )
          : CircleAvatar(
              radius: 25.0,
              backgroundColor: Theme.of(context).primaryColor,
              child: Texts(
                contact.fullName?.forImage() ?? NA,
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
      title: Container(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Texts(
              contact.fullName!,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16.0),
            ),
            h5,
            Texts(
              contact.blockchainAddress!,
              color: context.subtitleColor,
              fontSize: 11.5,
            ),
            h5,
            RatingBar.builder(
              minRating: 0,
              itemCount: 5,
              itemSize: 18.0,
              initialRating: contact.trustLevel?.toDouble() ?? 0,
              ignoreGestures: true,
              allowHalfRating: true,
              direction: Axis.horizontal,
              unratedColor: Colors.grey[400],
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: context.primaryColor,
              ),
              onRatingUpdate: (rating) {},
            ),
          ],
        ),
      ),
      trailing: GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          backgroundColor: context.primaryColor,
          child: SvgPicture.asset(
            Assets.svgSend,
            color: Colors.white,
            width: 16.0,
            height: 16.0,
          ),
        ),
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).dialogBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Palette.accentColor),
        ],
      ),
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Slidable(
        key: ValueKey(contact.jid!),
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteContact,
              backgroundColor: Palette.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),

        // Actual child to be shown
        child: GestureDetector(
          child: child,
          onTap: () {
            navigationService.navigateTo(
              Routes.addOrEditContacts.value,
              arguments: EditContactsArguments(
                contact: contact,
              ),
            );
          },
        ),
      ),
    );
  }

  void deleteContact(BuildContext context) async {
    final result = await dialogService.showConfirmationDialog(
      title: Strings.deleteThisContact,
      cancelTitle: Strings.cancel.toUpperCase(),
      confirmationTitle: Strings.delete.toUpperCase(),
    );

    if (result != null && result.confirmed) {
      await hiveStorage.deleteContact(contact);
    }
  }
}
