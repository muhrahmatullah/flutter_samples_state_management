import 'dart:convert';

import 'package:http/http.dart';
import 'package:state_management_sample/model/nba_team_response.dart';

class NbaTeamService {

  Future<NbaTeamResponse?> fetchTeams(int page, int perPage) async{
    var response;
    try {
      final uri = Uri.parse('https://www.balldontlie.io/api/v1/teams?page=$page&per_page=$perPage');
      response = await get(uri);
    } catch(e){
      return throw('Network error: ${e.toString()}');
    }

    if(response.statusCode/100 > 2) {
      return null;
    }

    final NbaTeamResponse res = NbaTeamResponse.fromJson(json.decode(response.body));

    return res;
  }

}

