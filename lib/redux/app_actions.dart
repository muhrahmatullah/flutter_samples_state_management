import 'package:state_management_sample/model/nba_team_response.dart';

class SetLoadingAction {
  final bool isLoading;

  SetLoadingAction(this.isLoading);
}

class SetPageAction {
  final int page;

  SetPageAction(this.page);
}

class SetCanLoadAction {
  final bool canLoad;

  SetCanLoadAction(this.canLoad);
}

class SetLoadedResponse {
  final NbaTeamResponse response;

  SetLoadedResponse(this.response);
}

class AppendResponse {
  final NbaTeamResponse response;

  AppendResponse(this.response);
}

class FetchTeamsAction{}