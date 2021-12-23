import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/hive_adapters/contact/kyc_contact.dart';
import 'package:kyc3/ui/main_screen/widgets/item_coversation.dart';
import 'package:kyc3/widgets/base_scaffold.dart';
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
      title: "Search Conversation",
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
              hint: "Search Conversation",
              onChanged: (v) {},
            ),
          ),
          SliverFillRemaining(
            child: FutureBuilder<List<KycContact>>(
              future: Future.value(hiveStorage.getAllContactsExceptAddedConversations()),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final list = snapshot.data;
                  if (list == null || list.isEmpty) return const NoDataFound(msg: "No contacts!");
                  return ListView.builder(
                    itemCount: list.length,
                    padding: const EdgeInsets.only(top: 13.0, bottom: kBottomNavigationBarHeight),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (_, index) {
                      final item = list[index];
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
                }
                return const NativeLoader();
              },
            ),
          ),
        ],
      ),
    );
  }
}
