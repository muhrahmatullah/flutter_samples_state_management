
import 'package:flu_arch_comp/model/meta.dart';
import 'package:flu_arch_comp/model/team.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nba_response.g.dart';

@JsonSerializable(explicitToJson: true)
class NbaTeamResponse {

  NbaTeamResponse({this.data, this.meta});

  final List<NbaTeam> data;
  final MetaInfo meta;

  factory NbaTeamResponse.fromJson(Map<String, dynamic> json) => _$NbaTeamResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NbaTeamResponseToJson(this);

}