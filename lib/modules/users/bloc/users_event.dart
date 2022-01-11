part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UsersRequested extends UsersEvent {}
