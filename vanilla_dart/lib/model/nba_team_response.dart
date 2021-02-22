
import 'package:json_annotation/json_annotation.dart';
import 'package:state_management_sample/model/meta.dart';
import 'package:state_management_sample/model/team.dart';

part 'nba_team_response.g.dart';

@JsonSerializable(explicitToJson: true)
class NbaTeamResponse {

  NbaTeamResponse({this.data, this.meta});

  final List<NbaTeam> data;
  final MetaInfo meta;

  factory NbaTeamResponse.fromJson(Map<String, dynamic> json) => _$NbaTeamResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NbaTeamResponseToJson(this);

}