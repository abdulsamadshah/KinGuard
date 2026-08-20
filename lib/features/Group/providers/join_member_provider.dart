import 'package:flutter_riverpod/legacy.dart';
import 'package:kinguard/features/Group/controllers/join_member_controller.dart';
import 'package:kinguard/features/Group/state/join_member_state.dart';

final joinMemberProvider =
StateNotifierProvider.autoDispose<JoinMemberController, JoinMemberState>(
        (ref) => JoinMemberController(ref),
);