import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/hive_adapters/contact/kyc_contact.dart';
import 'package:kyc3/models/hive_adapters/invoices/kyc_invoice.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class HiveStorage {
  static const kycContactsBox = 'kycContactsBox';
  static const kycConversationsBox = 'kycConversationsBox';
  static const kycLocalInvoicesBox = 'kycLocalInvoicesBox';

  late final SharedPreferences _prefs;
  Box<KycContact>? boxContacts;
  Box<KycContact>? boxConversations;
  Box<KycInvoice>? boxLocalInvoices;
  late Box<KycContact> userBox;

  Future<void> initHiveStorage() async {
    _prefs = await SharedPreferences.getInstance();

    Hive.registerAdapter(KycContactAdapter());
    Hive.registerAdapter(KycInvoiceAdapter());
    userBox = await Hive.openBox(Keys.userData);
    Future.wait([
      openContactsBox(),
      openConversationsBox(),
      openLocalInvoicesBox(),
    ]);
  }

  Future clearAll() async {
    return await Future.wait([
      userBox.clear(),
      clearContacts(),
      clearConversations(),
      clearAllInvoices(),
      _prefs.remove(Keys.userData),
      _prefs.remove(kycContactsBox),
      _prefs.remove(kycConversationsBox),
      _prefs.remove(kycLocalInvoicesBox),
    ]);
  }

  Future openContactsBox() async {
    final contactsEncryptionKey = _prefs.containsKey(kycContactsBox);
    if (!contactsEncryptionKey) {
      final key = Hive.generateSecureKey();
      _prefs.setString(kycContactsBox, base64UrlEncode(key));
    }

    final value = _prefs.getString(kycContactsBox);

    if (value != null) {
      final encryptionKey = base64Url.decode(value);
      boxContacts = await Hive.openBox(kycContactsBox, encryptionCipher: HiveAesCipher(encryptionKey));
    }
  }

  Future openConversationsBox() async {
    final contactsEncryptionKey = _prefs.containsKey(kycConversationsBox);
    if (!contactsEncryptionKey) {
      final key = Hive.generateSecureKey();
      _prefs.setString(kycConversationsBox, base64UrlEncode(key));
    }

    final value = _prefs.getString(kycConversationsBox);

    if (value != null) {
      final encryptionKey = base64Url.decode(value);
      boxConversations =
          await Hive.openBox(kycConversationsBox, encryptionCipher: HiveAesCipher(encryptionKey));
    }
  }

  Future openLocalInvoicesBox() async {
    final contactsEncryptionKey = _prefs.containsKey(kycLocalInvoicesBox);
    if (!contactsEncryptionKey) {
      final key = Hive.generateSecureKey();
      _prefs.setString(kycLocalInvoicesBox, base64UrlEncode(key));
    }

    final value = _prefs.getString(kycLocalInvoicesBox);

    if (value != null) {
      final encryptionKey = base64Url.decode(value);
      boxLocalInvoices =
          await Hive.openBox(kycLocalInvoicesBox, encryptionCipher: HiveAesCipher(encryptionKey));
    }
  }

  /// Contacts helpers

  List<KycContact>? getAllContacts() => boxContacts?.values.toList();

  ValueListenable<Box<KycContact>>? liveContactsList() => boxContacts?.listenable();

  Future<dynamic> addContact(KycContact contact) async => await boxContacts?.add(contact);

  Future<dynamic> updateContact(KycContact contact) async => await boxContacts?.put(contact.key, contact);

  Future<dynamic> deleteContact(KycContact contact) async => await boxContacts?.delete(contact.key);

  List<KycContact>? getAllConversations() => boxConversations?.values.toList();

  Future<dynamic> clearContacts() async => await boxContacts?.clear();

  /// Conversations helpers

  ValueListenable<Box<KycContact>>? liveConversationsList() => boxConversations?.listenable();

  Future<dynamic> addConversations(KycContact contact) async => await boxConversations?.add(contact);

  Future<dynamic> updateConversations(KycContact contact) async =>
      await boxConversations?.put(contact.key, contact);

  Future<dynamic> deleteConversations(KycContact contact) async =>
      await boxConversations?.delete(contact.key);

  Future<dynamic> clearConversations() async => await boxConversations?.clear();

  /// Invoices helpers

  ValueListenable<Box<KycInvoice>>? liveInvoices() => boxLocalInvoices?.listenable();

  List<KycInvoice>? getAllInvoices() => boxLocalInvoices?.values.toList();

  Future<dynamic> addInvoiceToLocal(KycInvoice invoice) async => await boxLocalInvoices?.add(invoice);

  Future<dynamic> updateInvoiceToLocal(KycInvoice invoice) async =>
      boxLocalInvoices?.put(invoice.key, invoice);

  Future<dynamic> deleteInvoiceFromLocal(KycInvoice invoice) async =>
      await boxLocalInvoices?.delete(invoice.key);

  Future<dynamic> clearAllInvoices() async => await boxLocalInvoices?.clear();

  /// user profile

  ValueListenable<Box<KycContact>> liveUser() => userBox.listenable();

  KycContact? getUser() => userBox.isNotEmpty ? userBox.getAt(0) : null;

  Future<dynamic> addUser(KycContact contact) async => await userBox.add(contact);

  Future<dynamic> updateUser(KycContact contact) async => await userBox.put(contact.key, contact);

  Future<dynamic> deleteUser(KycContact contact) async => await userBox.put(contact.key, contact);
}
