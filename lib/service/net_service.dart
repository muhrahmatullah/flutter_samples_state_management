import 'package:http/http.dart';

class NbaTeamService {

  Future<dynamic> fetchTeams(int page, int perPage) async{

    final response = await get('https://www.balldontlie.io/api/v1/teams?page=$page&per_page=$perPage', );

    if(response.statusCode/100 > 2) {
      return null;
    }



    return null;
  }

}