import 'package:equatable/equatable.dart';
import 'package:state_management_sample/model/team.dart';

enum ScreenStatus {
  loading,
  data,
  error,
}

class NbaBlocState extends Equatable {
  const NbaBlocState({
    this.data = const <NbaTeam>[],
    this.hasNext = true,
    this.status = ScreenStatus.loading,
    this.page = 1,
  });

  final List<NbaTeam> data;

  final bool hasNext;

  final ScreenStatus status;

  final int page;

  NbaBlocState copyWith({List<NbaTeam>? data, bool? hasNext, ScreenStatus? status, int? page}) {
    return NbaBlocState(
      data: data ?? this.data,
      hasNext: hasNext ?? this.hasNext,
      status: status ?? this.status,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [data, hasNext];
}
