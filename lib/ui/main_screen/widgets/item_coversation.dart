import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/hive_adapters/contact/kyc_contact.dart';
import 'package:kyc3/utils/app_utils.dart';
import 'package:kyc3/widgets/cached_image.dart';
import 'package:kyc3/widgets/list_tile/custom_list_tile.dart';
import 'package:kyc3/widgets/text_widget.dart';

class ItemConversation extends StatelessWidget {
  final KycContact contact;
  final GestureTapCallback? onTap;

  const ItemConversation({Key? key, required this.contact, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      onTap: onTap ?? () {},
      padding: p10.copyWith(top: 14.0, bottom: 14),
      margin: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
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
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Texts(
              contact.fullName!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16.0),
            ),
            h5,
            Texts(
              contact.blockchainAddress!,
              color: context.subtitleColor,
              fontSize: 11.5,
            ),
          ],
        ),
      ),
      trailing: Texts(
        Utils.currentTime().toLowerCase(),
        color: context.textColor,
        fontSize: 12.0,
      ),
    );
  }
}
