import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kinguard/features/home/state/home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController(this.ref) : super(HomeState());

  final Ref ref;

  void indexChange({required int index}) {
    state = state.copyWith(currentIndex: index);
  }
}