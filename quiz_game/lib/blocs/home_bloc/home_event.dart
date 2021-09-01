import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeRequest extends HomeEvent {

  const HomeRequest();

  @override
  List<Object> get props => [];
}