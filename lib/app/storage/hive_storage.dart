import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/hive_adapters/contact/kyc_contact.dart';
import 'package:kyc3/models/hive_adapters/invoices/kyc_invoice.dart';

@singleton
class HiveStorage {
  static const kycContactsBox = 'kycContactsBox';
  static const kycConversationsBox = 'kycConversationsBox';
  static const kycLocalInvoicesBox = 'kycLocalInvoicesBox';
  final secureStorage = const FlutterSecureStorage();
  Box<KycContact>? boxContacts;
  Box<KycContact>? boxConversations;
  Box<KycInvoice>? boxLocalInvoices;

  Future<void> initHiveStorage() async {
    Hive.registerAdapter(KycContactAdapter());
    Hive.registerAdapter(KycInvoiceAdapter());
    Future.wait([
      openContactsBox(),
      openConversationsBox(),
      openLocalInvoicesBox(),
    ]);
  }

  Future openContactsBox() async {
    final contactsEncryptionKey = await secureStorage.containsKey(key: kycContactsBox);
    if (!contactsEncryptionKey) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(key: kycContactsBox, value: base64UrlEncode(key));
    }

    final value = await secureStorage.read(key: kycContactsBox);

    if (value != null) {
      final encryptionKey = base64Url.decode(value);
      boxContacts = await Hive.openBox(kycContactsBox, encryptionCipher: HiveAesCipher(encryptionKey));
    }
  }

  Future openConversationsBox() async {
    final contactsEncryptionKey = await secureStorage.containsKey(key: kycConversationsBox);
    if (!contactsEncryptionKey) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(key: kycConversationsBox, value: base64UrlEncode(key));
    }
    final value = await secureStorage.read(key: kycConversationsBox);

    if (value != null) {
      final encryptionKey = base64Url.decode(value);
      boxConversations =
          await Hive.openBox(kycConversationsBox, encryptionCipher: HiveAesCipher(encryptionKey));
    }
  }

  Future openLocalInvoicesBox() async {
    final contactsEncryptionKey = await secureStorage.containsKey(key: kycLocalInvoicesBox);
    if (!contactsEncryptionKey) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(key: kycLocalInvoicesBox, value: base64UrlEncode(key));
    }

    final value = await secureStorage.read(key: kycLocalInvoicesBox);

    if (value != null) {
      final encryptionKey = base64Url.decode(value);
      boxLocalInvoices =
          await Hive.openBox(kycLocalInvoicesBox, encryptionCipher: HiveAesCipher(encryptionKey));
    }
  }

  /// To add contacts locally
  List<KycContact>? getAllContacts() => boxContacts?.values.toList();

  ValueListenable<Box<KycContact>>? liveContactsList() => boxContacts?.listenable();

  Future<dynamic> addContact(KycContact contact) async => await boxContacts?.add(contact);

  Future<dynamic> updateContact(KycContact contact) async => await boxContacts?.put(contact.key, contact);

  Future<dynamic> deleteContact(KycContact contact) async => await boxContacts?.delete(contact.key);

  /// To add conversations locally
  List<KycContact>? getAllConversations() => boxConversations?.values.toList();

  Future<dynamic> clearContacts() async => await boxContacts?.clear();

  List<KycContact> getAllContactsExceptAddedConversations() {
    final list3 = [...?getAllContacts(), ...?getAllConversations()];
    return list3.unique((element) => element.blockchainAddress);
  }

  ValueListenable<Box<KycContact>>? liveConversationsList() => boxConversations?.listenable();

  Future<dynamic> addConversations(KycContact contact) async => await boxConversations?.add(contact);

  Future<dynamic> updateConversations(KycContact contact) async =>
      await boxConversations?.put(contact.key, contact);

  Future<dynamic> deleteConversations(KycContact contact) async => await boxConversations?.delete(contact.key);

  Future<dynamic> clearConversations() async => await boxConversations?.clear();

  ValueListenable<Box<KycInvoice>>? liveInvoices() => boxLocalInvoices?.listenable();

  List<KycInvoice>? getAllInvoices() => boxLocalInvoices?.values.toList();

  Future<dynamic> addInvoiceToLocal(KycInvoice invoice) async => await boxLocalInvoices?.add(invoice);

  Future<dynamic> updateInvoiceToLocal(KycInvoice invoice) async =>
      boxLocalInvoices?.put(invoice.key, invoice);

  Future<dynamic> deleteInvoiceFromLocal(KycInvoice invoice) async => await boxLocalInvoices?.delete(invoice.key);

  Future<dynamic> clearAllInvoices() async => await boxLocalInvoices?.clear();
}
