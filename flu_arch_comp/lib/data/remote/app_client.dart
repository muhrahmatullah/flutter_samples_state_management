import 'package:dio/dio.dart';

import 'package:flu_arch_comp/model/nba_response.dart';
import 'package:flu_arch_comp/model/team.dart';

import '../response_wrapper.dart';

class AppClientService {

  AppClientService(this.dio);

  final Dio dio;

  Future<List<NbaTeam>> fetchTeams(int page, {int perPage = 10}) async{
    Response response;
    try {
      response = await dio.get('https://www.balldontlie.io/api/v1/teams?page=$page&per_page=$perPage', );
    } catch(e){
      return null;
    }

    if(response.statusCode/100 > 2) {
      return null;
    }

    final NbaTeamResponse res = NbaTeamResponse.fromJson(response.data);

    return res.data;
  }
}
