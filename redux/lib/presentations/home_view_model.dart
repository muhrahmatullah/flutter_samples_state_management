
import 'package:redux/redux.dart';
import 'package:state_management_sample/model/meta.dart';
import 'package:state_management_sample/model/team.dart';
import 'package:state_management_sample/redux/app_state.dart';

class HomeScreenViewModel {

  final Store<AppState> store;

  HomeScreenViewModel(this.store);


  int get page => store.state.page;

  MetaInfo get meta => store.state.response.meta;

  List<NbaTeam> get teams => store.state.response.data;

  bool get canLoad => store.state.canLoad;

  bool get isLoading => store.state.isLoading;

  bool get isError => store.state.response == null;

}