import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hive/hive.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/app/router/routes.dart';
import 'package:kyc3/models/hive_adapters/contact/kyc_contact.dart';
import 'package:kyc3/ui/main_screen/widgets/item_contact.dart';
import 'package:kyc3/widgets/base_scaffold.dart';
import 'package:kyc3/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'contacts_cubit.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final liveList = context.read<ContactsCubit>().liveContacts();

    return BaseScaffold(
      isAppbar: true,
      titleStyle: CustomStyles.appbarTitle,
      backgroundColor: context.homeBackgroundColor,
      isLeading: false,
      title: "Contacts",
      applyShape: true,
      child: liveList == null
          ? const NoDataFound(msg: "No contacts!")
          : ValueListenableBuilder<Box<KycContact>>(
              valueListenable: liveList,
              builder: (context, box, _) {
                final _contacts = box.values.toList();

                if (_contacts.isEmpty) return const NoDataFound(msg: "No contacts!");

                return GroupedListView<KycContact, String>(
                  elements: _contacts,

                  /// group by alphabetic char/letter
                  groupBy: (element) => element.fullName!.substring(0, 1).toUpperCase(),
                  groupComparator: (value1, value2) => value2.compareTo(value1),
                  itemComparator: (item1, item2) => item1.fullName!.compareTo(item2.fullName!),
                  useStickyGroupSeparators: false,
                  padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                  groupSeparatorBuilder: (String value) => Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 16.0, right: 16.0),
                    child: Texts(
                      value,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  separator: const SizedBox(height: 10),
                  itemBuilder: (_, element) {
                    return ItemContact(contact: element);
                  },
                );
              },
            ),
      fabLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const _AddContactsFab(),
    );
  }
}

class _AddContactsFab extends StatefulWidget {
  const _AddContactsFab({Key? key}) : super(key: key);

  @override
  __AddContactsFabState createState() => __AddContactsFabState();
}

class __AddContactsFabState extends State<_AddContactsFab> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  bool isOpen = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomFloatButton(
      items: <Bubble>[
        Bubble(
          title: Strings.newContacts,
          icon: CircleAvatar(
            backgroundColor: Theme.of(context).splashColor,
            child: SvgPicture.asset(
              Assets.svgAddContacts,
              width: 24.0,
              height: 24.0,
            ),
          ),
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () async {
            await close();
            navigationService.navigateTo(Routes.addOrEditContacts.value);
          },
        ),
        Bubble(
          title: Strings.sendContacts,
          icon: CircleAvatar(
            backgroundColor: Theme.of(context).splashColor,
            child: SvgPicture.asset(
              Assets.svgSendContacts,
              width: 24.0,
              height: 24.0,
            ),
          ),
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            close();
          },
        ),
      ],
      animation: _animation,
      animationController: _animationController,
      onPress: () {
        if (isOpen) {
          close();
        } else {
          open();
        }
      },
      backgroundColor: context.primaryColor,
    );
  }

  Future open() async {
    await _animationController.forward().then((value) {
      isOpen = true;
    });
  }

  Future close() async {
    await _animationController.reverse().then((value) {
      isOpen = false;
    });
  }
}
