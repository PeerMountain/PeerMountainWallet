import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/hive_adapters/contact/kyc_contact.dart';
import 'package:kyc3/ui/chat_screen/widgets/base_message.dart';
import 'package:kyc3/utils/export_utils.dart';
import 'package:kyc3/widgets/widgets.dart';

import 'chat_text_field.dart';
import 'cubit/chat_cubit.dart';

class ChatScreen extends StatefulWidget {
  final KycContact user;

  const ChatScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  KycContact sender = KycContact();
  late KycContact receiver;

  bool isExistsLocally = false;

  @override
  void initState() {
    super.initState();

    isChatScreenOpen = true;

    sender
      ..blockchainAddress = cryptoAccount.address
      ..jid = cryptoAccount.address!.addXmppKycHost();
    receiver = widget.user;

    final contacts = hiveStorage.getAllContacts() ?? [];

    isExistsLocally = contacts.any((element) => element.blockchainAddress == receiver.blockchainAddress);

    context.read<ChatCubit>().initChatService(address: receiver.blockchainAddress!);
  }

  @override
  void dispose() {
    super.dispose();
    isChatScreenOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<ChatCubit>().clear();
        return Future.value(true);
      },
      child: BaseScaffold(
        title: receiver.fullName,
        backgroundColor: context.homeBackgroundColor,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  if (!isExistsLocally)
                    Container(
                      height: 45,
                      color: context.cardColor,
                      child: InkWell(
                        onTap: () async {
                          final result = await navigationService.navigateTo(
                            Routes.addOrEditContacts.value,
                            arguments: EditContactsArguments(
                              contact: receiver,
                              title: receiver.fullName,
                              isNew: true,
                            ),
                          );
                        },
                        child: const Center(
                          child: Texts(Strings.addToContact),
                        ),
                      ),
                    ),
                  const Expanded(child: _ActualChatList()),
                ],
              ),
            ),
            const ChatTextField(),
          ],
        ),
      ),
    );
  }
}

class _ActualChatList extends StatelessWidget {
  const _ActualChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state.chats == null) {
          return const SizedBox();
        }
        return GroupedListView<dynamic, String>(
          elements: state.chats!,
          // floatingHeader: true,
          useStickyGroupSeparators: true,
          floatingHeader: true,
          padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),

          /// group by date
          groupBy: (element) => Utils.formatMillis(element.createdOn!),
          groupComparator: (value1, value2) => value1.compareTo(value2),
          itemComparator: (item1, item2) => item1.createdOn!.compareTo(item2.createdOn!),
          stickyHeaderBackgroundColor: Colors.transparent,
          groupSeparatorBuilder: (String value) {
            String date = value;

            if (Utils.isYesterday(value, Constants.longDateFormat)) {
              date = Strings.yesterday;
            } else if (Utils.isCurrentDate(value, Constants.longDateFormat)) {
              date = Strings.today;
            }

            return Container(
              height: 45,
              color: Colors.transparent,
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 16.0, right: 16.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Palette.appBarColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: p5.copyWith(left: 10, right: 10),
                  child: Texts(
                    date,
                    color: context.textBlack,
                  ),
                ),
              ),
            );
          },
          itemBuilder: (_, message) => BaseMessage(message: message),
        );
      },
    );
  }
}
