import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kinguard/features/home/services/homeServices.dart';
import 'package:kinguard/features/home/state/home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController(this.ref) : super(HomeState()) {
    getUserGroups();
  }

  final Ref ref;

  Future<void> getUserGroups() async {
    try {
      state = state.copyWith(clearError: true);

      final response = await HomeServices.getUserGroups();

      if (response.status == true) {
        state = state.copyWith(
          groups: response.data ?? [],
        );
      } else {
        state = state.copyWith(
          errorMessage: response.message ?? 'Failed to load groups',
        );
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  void selectGroup(int index) {
    state = state.copyWith(selectedGroupIndex: index);
  }

  void selectBottomIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  Future<void> refresh() async {
    await getUserGroups();
  }


}