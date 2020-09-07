import 'dart:convert';

import 'package:http/http.dart';
import 'package:state_management_sample/model/nba_team_response.dart';

class NbaTeamService {

  Future<NbaTeamResponse> fetchTeams(int page, {int perPage = 10}) async{
    var response;
    try {
      response = await get('https://www.balldontlie.io/api/v1/teams?page=$page&per_page=$perPage', );
    } catch(e){
      return null;
    }

    if(response.statusCode/100 > 2) {
      return null;
    }

    final NbaTeamResponse res = NbaTeamResponse.fromJson(json.decode(response.body));

    return res;
  }

}