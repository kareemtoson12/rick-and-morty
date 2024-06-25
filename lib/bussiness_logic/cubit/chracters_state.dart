part of 'chracters_cubit.dart';

@immutable
sealed class ChractersState {}

final class ChractersInitial extends ChractersState {}

// ignore: must_be_immutable
class ChractersLoaded extends ChractersState {
  late List<Result> chracters;
  ChractersLoaded(this.chracters);
}
