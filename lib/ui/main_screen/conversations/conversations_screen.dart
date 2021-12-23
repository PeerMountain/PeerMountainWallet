import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/hive_adapters/contact/kyc_contact.dart';
import 'package:kyc3/ui/main_screen/widgets/item_coversation.dart';
import 'package:kyc3/widgets/base_scaffold.dart';
import 'package:kyc3/widgets/widgets.dart';

class ConversationsScreen extends StatefulWidget {
  const ConversationsScreen({Key? key}) : super(key: key);

  @override
  _ConversationsScreenState createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      isAppbar: true,
      titleStyle: CustomStyles.appbarTitle,
      backgroundColor: context.homeBackgroundColor,
      isLeading: false,
      title: "Conversations",
      applyShape: true,
      child: Builder(
        builder: (_) {
          final liveList = hiveStorage.liveConversationsList();
          return liveList == null
              ? const NoDataFound(msg: "No conversations!")
              : ValueListenableBuilder<Box<KycContact>>(
                  valueListenable: liveList,
                  builder: (context, box, _) {
                    final _conversations = box.values.toList();

                    if (_conversations.isEmpty) return const NoDataFound(msg: "No conversations!");
                    return CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.only(top: 13.0, bottom: kBottomNavigationBarHeight),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (_, index) {
                                return ItemConversation(
                                  contact: _conversations[index],
                                  onTap: () {
                                    navigationService.navigateTo(
                                      Routes.chatScreen.value,
                                      arguments: ChatScreenArguments(user: _conversations[index]),
                                    );
                                  },
                                );
                              },
                              childCount: _conversations.length,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.primaryColor,
        heroTag: "__conversation_fab__",
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 35.0,
        ),
        onPressed: () {
          navigationService.navigateTo(Routes.searchConversations.value);
        },
      ),
    );
  }
}
