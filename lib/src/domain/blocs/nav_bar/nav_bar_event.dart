part of 'nav_bar_bloc.dart';

abstract class NavBarEvent extends Equatable {
  const NavBarEvent();

  @override
  List<Object> get props => [];
}

class NavBarChangeIndexEvent extends NavBarEvent {
  final int index;

  const NavBarChangeIndexEvent(this.index);

  @override
  List<Object> get props => [index];
}
