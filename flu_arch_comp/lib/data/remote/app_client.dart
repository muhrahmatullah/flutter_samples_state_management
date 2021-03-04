import 'dart:convert';
import 'package:http/http.dart';

import 'package:flu_arch_comp/model/nba_response.dart';

import '../response_wrapper.dart';

class AppClientService {
  Future<ResponseWrapper<NbaTeamResponse>> fetchTeams(int page, {int perPage = 10}) async{
    Response response;
    try {
      response = await get('https://www.balldontlie.io/api/v1/teams?page=$page&per_page=$perPage', );
    } catch(e){
      return ResponseWrapper.error(message: e.toString(), error: true);
    }

    if(response.statusCode/100 > 2) {
      return ResponseWrapper.error(message: 'api error with code: ${response.statusCode}', error: true);
    }

    final NbaTeamResponse res = NbaTeamResponse.fromJson(json.decode(response.body));

    return ResponseWrapper.success(data: res);
  }
}
