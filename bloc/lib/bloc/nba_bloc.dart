import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:state_management_sample/bloc/bloc.dart';
import 'package:state_management_sample/service/net_service.dart';
import 'package:stream_transform/stream_transform.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class NbaBloc extends Bloc<NbaBlocEvent, NbaBlocState> {
  NbaBloc({this.service}) : super(const NbaBlocState()) {
    on<FetchDataEvent>(_onFetchDataEvent, transformer: throttleDroppable(throttleDuration));
  }

  final NbaTeamService? service;

  FutureOr<void> _onFetchDataEvent(FetchDataEvent event, Emitter<NbaBlocState> emit) async {
    if (!state.hasNext) return;
    try {
      final response = await service?.fetchTeams(state.page, 10);
      final data = response?.data;
      bool hasNext = response?.meta?.nextPage != null;
      int nextPage = hasNext ? (state.page + 1) : state.page;
      emit(state.copyWith(status: ScreenStatus.data, data: List.of(state.data)..addAll(data ?? []), page: nextPage, hasNext: hasNext));
    } catch (_) {
      emit(state.copyWith(status: ScreenStatus.error));
    }
  }
}
