import 'package:flu_arch_comp/data/remote/app_client.dart';
import 'package:flu_arch_comp/data/response_wrapper.dart';
import 'package:flu_arch_comp/model/nba_response.dart';

class Repository {
  const Repository(this._service);

  final AppClientService _service;

  Future<ResponseWrapper<NbaTeamResponse>> fetchTeams(int page) async {
    // handle remote and local data source here if needed
    return await _service.fetchTeams(page);
  }

}
