import 'package:bloc/bloc.dart';
import 'package:state_management_sample/bloc/bloc.dart';
import 'package:state_management_sample/service/net_service.dart';

class NbaBloc extends Bloc<NbaBlocEvent, NbaBlocState> {
  final NbaTeamService? service;

  NbaBloc({this.service}) : super(Loading());

  @override
  Stream<NbaBlocState> mapEventToState(NbaBlocEvent event) async* {
    if (event is FetchDataEvent) {
      try {
        final response = await service?.fetchTeams(1, 10);
        yield Succes(response?.data);
        return;
      } catch(_) {
        yield Error();
      }
    }
  }
}
