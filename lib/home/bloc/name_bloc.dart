import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'name_event.dart';
part 'name_state.dart';

class NameBloc extends Bloc<NameEvent, NameState> {
  NameBloc() : super(NameInitial()) {
    on<NameChanged>((event, emit) {
      if (event.name.isEmpty) {
        emit(NameLoadFailure('Name is required and cannot be blank'));
      } else {
        emit(NameLoadSuccess(event.name));
      }
    });
  }
}
