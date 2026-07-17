
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthService {
  Future<void> sendOtp(String phone) async {
    // API Call
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});