
import 'package:flutter_riverpod/legacy.dart';
import 'package:kinguard/features/profile/controllers/profileController.dart';
import 'package:kinguard/features/profile/state/profileState.dart';

final profileProvider = StateNotifierProvider<ProfileController,ProfileState>(
    (ref)=>ProfileController(ref)
);