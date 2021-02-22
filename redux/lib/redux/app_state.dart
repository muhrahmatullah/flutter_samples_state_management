import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:state_management_sample/model/nba_team_response.dart';

@immutable
class AppState extends Equatable {
  final NbaTeamResponse response;

  final bool isLoading;

  final bool canLoad;

  final int page;

  AppState({NbaTeamResponse nbaTeamResponse, this.isLoading = true, this.canLoad = true, this.page = 1})
      : response = nbaTeamResponse ?? NbaTeamResponse();

  AppState copyWith({NbaTeamResponse response, bool isLoading, bool canLoad, int page}) {
    return AppState(
        nbaTeamResponse: response ?? this.response,
        isLoading: isLoading ?? this.isLoading,
        canLoad: canLoad ?? this.canLoad,
        page: page ?? this.page);
  }

  @override
  List<Object> get props => [response, isLoading, canLoad, page];
}
