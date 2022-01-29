import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/hive_adapters/contact/kyc_contact.dart';
import 'package:kyc3/ui/main_screen/widgets/item_add_new_contact.dart';
import 'package:kyc3/ui/main_screen/widgets/item_conversation.dart';
import 'package:kyc3/widgets/widgets.dart';

class SearchConversationsScreen extends StatefulWidget {
  const SearchConversationsScreen({Key? key}) : super(key: key);

  @override
  _SearchConversationsScreenState createState() => _SearchConversationsScreenState();
}

class _SearchConversationsScreenState extends State<SearchConversationsScreen> {
  final tcSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tcSearch.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      isAppbar: true,
      titleStyle: CustomStyles.appbarTitle,
      backgroundColor: context.homeBackgroundColor,
      isLeading: true,
      title: Strings.searchConversation,
      applyShape: false,
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Palette.appBarColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18.0),
                bottomRight: Radius.circular(18.0),
              ),
            ),
            toolbarHeight: kToolbarHeight + 10.0,
            elevation: 0.0,
            forceElevated: false,
            pinned: true,
            automaticallyImplyLeading: false,
            title: SearchTextField(
              controller: tcSearch,
              hint: Strings.searchConversation,
              onChanged: (v) {},
            ),
          ),
          SliverFillRemaining(
            child: Builder(
              builder: (context) {
                final liveList = hiveStorage.liveContactsList();
                return liveList == null
                    ? const NoDataFound(msg: Strings.noConversations)
                    : ValueListenableBuilder<Box<KycContact>>(
                        valueListenable: liveList,
                        builder: (context, box, _) {
                          final contactsList = box.values.toList();

                          if (contactsList.isEmpty) {
                            return Column(
                              children: [
                                const SizedBox(height: 13),
                                ItemAddNewContact(
                                  onTap: () => navUtils.addNewContact(),
                                ),
                                const Expanded(child: NoDataFound(msg: Strings.noContacts)),
                              ],
                            );
                          }

                          return ValueListenableBuilder<Object>(
                            valueListenable: tcSearch,
                            builder: (context, value, child) {
                              var tempList = <KycContact>[];

                              final query = tcSearch.text.trim().justifyContent();
                              final isSearching = query.isNotEmpty;
                              if (isSearching) {
                                tempList = contactsList
                                    .toList()
                                    .where((element) =>
                                        element.nickName!.contains(query) ||
                                        element.fullName!.contains(query) ||
                                        element.blockchainAddress!.contains(query) ||
                                        element.jid!.removeHost().contains(query))
                                    .toList();
                              } else {
                                tempList = contactsList;
                              }

                              return ListView.builder(
                                itemCount: !isSearching ? tempList.length + 1 : tempList.length,
                                padding: const EdgeInsets.only(top: 13.0, bottom: kBottomNavigationBarHeight),
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (_, index) {
                                  if (!isSearching) {
                                    if (index == 0) {
                                      return ItemAddNewContact(onTap: () => navUtils.addNewContact());
                                    }
                                  }
                                  final item = tempList[isSearching ? index : index - 1];
                                  return ItemConversation(
                                    contact: item,
                                    onTap: () {
                                      navigationService.navigateTo(
                                        Routes.chatScreen.value,
                                        arguments: ChatScreenArguments(user: item),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
