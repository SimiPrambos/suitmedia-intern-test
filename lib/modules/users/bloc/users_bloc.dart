import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:suitmedia/data/data.dart';

part 'users_event.dart';
part 'users_state.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc(this.repository) : super(const UsersState()) {
    on<UsersRequested>(
      _onUsersRequested,
      transformer: throttleDroppable(const Duration(milliseconds: 100)),
    );
  }

  final UserRepository repository;

  Future<void> _onUsersRequested(
    UsersRequested event,
    Emitter<UsersState> emit,
  ) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == UsersStateStatus.initial) {
        final result = await repository.findAll();
        return emit(
          state.copyWith(
            status: UsersStateStatus.success,
            users: result.data,
            page: result.page,
            hasReachedMax: result.hasReachedMax,
          ),
        );
      }

      final result = await repository.findAll(page: state.page + 1);
      emit(
        state.copyWith(
          status: UsersStateStatus.success,
          users: List.of(state.users)..addAll(result.data),
          page: result.page,
          hasReachedMax: result.hasReachedMax,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: UsersStateStatus.failure));
    }
  }
}
