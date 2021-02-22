import 'package:redux/redux.dart';
import 'package:state_management_sample/redux/app_actions.dart';
import 'package:state_management_sample/redux/app_state.dart';
import 'package:state_management_sample/service/net_service.dart';

List<Middleware<AppState>> createMiddleware(NbaTeamService service) {

  final fetchTeams = _createFetchTeams(service);


  return [TypedMiddleware<AppState, FetchTeamsAction>(fetchTeams)];
}

Middleware<AppState> _createFetchTeams(NbaTeamService service) {
  return (Store<AppState> store, action, NextDispatcher next) {
    service.fetchTeams(store.state.page, ).then((value) {

      store.dispatch(SetLoadingAction(false));

      if(store.state.page > 1) {
        store.dispatch(AppendResponse(value));
      } else {
        store.dispatch(SetLoadedResponse(value));
      }

      if(value.meta.totalPage > store.state.page) {
        int page = store.state.page;
        store.dispatch(SetPageAction(page++));
        store.dispatch(SetCanLoadAction(true));
      } else {
        store.dispatch(SetCanLoadAction(false));
      }

    }).catchError((e) {
      print(e.toString());
      store.dispatch(SetLoadingAction(false));
      store.dispatch(SetLoadedResponse(null));
    });
    next(action);
  };
}