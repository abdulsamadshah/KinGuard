import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class InviteHelper {
  /// Change this to your real invite / app link
  static const String inviteLink = 'https://kinguard.app/invite';

  static const String inviteMessage =
      'Hey! Join me on KinGuard and stay safe together 🛡️\n\n'
      'Download now: $inviteLink';

  // ===================== WHATSAPP =====================
  static Future<void> shareViaWhatsApp(BuildContext context) async {
    final uri = Uri.parse(
      'https://wa.me/?text=${Uri.encodeComponent(inviteMessage)}',
    );

    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        _showError(context, 'WhatsApp is not installed');
      }
    } catch (_) {
      _showError(context, 'Could not open WhatsApp');
    }
  }

  // ===================== MESSAGES (SMS) =====================
  static Future<void> shareViaMessages(BuildContext context) async {
    // Works on both Android & iOS
    final uri = Uri.parse(
      'sms:?body=${Uri.encodeComponent(inviteMessage)}',
    );

    try {
      final launched = await launchUrl(uri);
      if (!launched) {
        _showError(context, 'Could not open Messages');
      }
    } catch (_) {
      _showError(context, 'Could not open Messages');
    }
  }

  // ===================== COPY LINK =====================
  static Future<void> copyInviteLink(BuildContext context) async {
    await Clipboard.setData(const ClipboardData(text: inviteLink));

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Invite link copied!'),
        backgroundColor: const Color(0xFF10B981),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // ===================== MORE (System Share Sheet) =====================
  static Future<void> shareMore(BuildContext context) async {
    try {
      await Share.share(
        inviteMessage,
        subject: 'Join me on KinGuard',
      );
    } catch (_) {
      _showError(context, 'Could not open share sheet');
    }
  }

  // ===================== PRIVATE =====================
  static void _showError(BuildContext context, String message) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFFEF4444),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}