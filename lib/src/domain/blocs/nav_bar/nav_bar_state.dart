part of 'nav_bar_bloc.dart';

class NavBarState extends Equatable {
  const NavBarState({
    this.index = 0,
  });

  final int index;

  @override
  List<Object> get props => [index];

  NavBarState copyWith({
    int? index,
  }) {
    return NavBarState(
      index: index ?? this.index,
    );
  }
}
