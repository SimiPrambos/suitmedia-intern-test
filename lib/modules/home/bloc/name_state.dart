part of 'name_bloc.dart';

@immutable
abstract class NameState {}

class NameInitial extends NameState {}

class NameLoadSuccess extends NameState {
  NameLoadSuccess(this.name);
  final String name;
}

class NameLoadFailure extends NameState {
  NameLoadFailure(this.message);
  final String message;
}
