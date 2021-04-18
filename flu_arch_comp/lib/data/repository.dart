import 'package:flu_arch_comp/data/local/app_database.dart';
import 'package:flu_arch_comp/data/remote/app_client.dart';
import 'package:flu_arch_comp/data/response_wrapper.dart';
import 'package:flu_arch_comp/model/team.dart';

class Repository {
  const Repository(this._service, this._db);

  final AppClientService _service;
  final AppDatabase _db;

  Future<ResponseWrapper<List<NbaTeam>>> fetchTeams(int page, {bool forceUpdate = false}) async {
    List<NbaTeamDataData> data = await _db.fetchAll();

    if (data == null || data.isEmpty || forceUpdate) {
      final netCallData = await _service.fetchTeams(page);
      if (netCallData != null) {
        await _db.insertTeams(netCallData);
        return ResponseWrapper.success(data: netCallData);
      } else {
        return ResponseWrapper.error(error: true);
      }
    }

    return ResponseWrapper.success(data: mapToNbaTeams(data));
  }


  List<NbaTeam> mapToNbaTeams(List<NbaTeamDataData> data) {
    return data
        .map((item) => NbaTeam(
      item.id,
      item.abbreviation,
      item.city,
      item.conference,
      item.division,
      item.fullName,
      item.name,
    ))
        .toList();
  }

}
