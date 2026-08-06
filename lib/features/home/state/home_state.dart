class HomeState {
  int? currentIndex;
  HomeState({this.currentIndex});

  HomeState copyWith({int? currentIndex}) {
    return HomeState(currentIndex: currentIndex ?? this.currentIndex);
  }
}
