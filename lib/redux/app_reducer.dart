import 'package:redux/redux.dart';
import 'package:state_management_sample/model/nba_team_response.dart';
import 'package:state_management_sample/redux/app_actions.dart';

import 'app_state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
      isLoading: loadingReducer(state.isLoading, action),
      nbaTeamResponse: responseReducer(state.response, action),
      canLoad: canLoadReducer(state.canLoad, action),
      page: pageReducer(state.page, action));
}

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, SetLoadingAction>((bool state, action) {
    return action.isLoading;
  })
]);

final responseReducer = combineReducers<NbaTeamResponse>([
  TypedReducer<NbaTeamResponse, SetLoadedResponse>((NbaTeamResponse response, action) {
    return action.response;
  })
]);

final canLoadReducer = combineReducers<bool>([
  TypedReducer<bool, SetCanLoadAction>((bool canLoad, action) {
    return action.canLoad;
  })
]);

final pageReducer = combineReducers<int>([
  TypedReducer<int, SetPageAction>((int page, action) {
    return action.page;
  })
]);
