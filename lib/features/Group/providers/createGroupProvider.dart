import 'package:flutter_riverpod/legacy.dart';
import 'package:kinguard/features/Group/controllers/createGroupController.dart';
import 'package:kinguard/features/Group/state/createGroupState.dart';

final createGroupProvider =
    StateNotifierProvider<createGroupController, CreateGroupState>(
      (ref) => createGroupController(ref),
    );
