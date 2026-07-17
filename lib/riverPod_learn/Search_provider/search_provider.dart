import 'package:flutter_riverpod/legacy.dart';

final searchProvider = StateNotifierProvider<searchNotifier, SearchState>((
  ref,
) {
  return searchNotifier();
});

class searchNotifier extends StateNotifier<SearchState> {
  searchNotifier() : super(SearchState(searchValue: '', isSearchOn: true));

  void search(String query) {
    state = state.copyWith(searchValue: query);
  }

  void disableField({required bool isValue}) {
    state = state.copyWith(isSearchOn: isValue);
  }
}

//===============MUlti state Handling =========================//
class SearchState {
  String searchValue;
  bool isSearchOn;
  SearchState({required this.searchValue, required this.isSearchOn});

  SearchState copyWith({String? searchValue, bool? isSearchOn}) {
    return SearchState(
      searchValue: searchValue ?? this.searchValue,
      isSearchOn: isSearchOn ?? this.isSearchOn,
    );
  }
}
