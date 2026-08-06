import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../state/createGroupState.dart';

class createGroupController extends StateNotifier<CreateGroupState> {
  createGroupController(this.ref) : super(CreateGroupState());



  final Ref ref;

  void selectType(type) {
   state= state.copyWith(selectedIndex: type);
  }
}
