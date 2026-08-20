import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactHelper {
  static Future<Map<String, String>> getContactPhoneMap() async {
    final status = await Permission.contacts.request();
    if (!status.isGranted) return {};

    final contacts = await FlutterContacts.getContacts(
      withProperties: true,
    );

    final Map<String, String> phoneToNameMap = {};

    for (final contact in contacts) {
      for (final phone in contact.phones) {
        final normalized = _normalize(phone.number);
        if (normalized.isNotEmpty) {
          phoneToNameMap[normalized] = contact.displayName;
        }
      }
    }

    return phoneToNameMap;
  }

  /// Normalize phone: remove +, spaces, dashes, take last 10 digits
  static String _normalize(String phone) {
    final cleaned = phone.replaceAll(RegExp(r'[^\d]'), '');
    if (cleaned.length >= 10) {
      return cleaned.substring(cleaned.length - 10);
    }
    return cleaned;
  }

  static String normalizeForMatch(String phone) => _normalize(phone);
}