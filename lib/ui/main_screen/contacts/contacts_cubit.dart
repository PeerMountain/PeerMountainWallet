import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/hive_adapters/contact/kyc_contact.dart';
import 'package:kyc3/utils/app_events.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit() : super(const ContactsState.loading());

  ValueListenable<Box<KycContact>>? _contactsListen;

  ValueListenable<Box<KycContact>>? liveContacts() {
    _contactsListen ??= hiveStorage.liveContactsList();
    return _contactsListen;
  }
}
