import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz_game/models/result.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final Result lastResult;
  final Result bestResult;
  final List<Result> results;

  const HomeSuccess({
    @required this.results,
    @required this.lastResult,
    @required this.bestResult,
  }) : assert(
          lastResult != null,
          bestResult != null,
        );

  factory HomeSuccess.copyWith(
      {Result lastResult, Result bestResult, List<Result> results}) {
    return HomeSuccess(
      results: results,
      lastResult: lastResult,
      bestResult: bestResult,
    );
  }
}

class HomeFailure extends HomeState {}
