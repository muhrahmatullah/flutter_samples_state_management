
import 'package:json_annotation/json_annotation.dart';

part 'team.g.dart';

@JsonSerializable(nullable: false)
class NbaTeam {

  NbaTeam(this.id, this.abbreviation, this.city, this.conference, this.division, this.fullName, this.name);

  final int id;
  final String abbreviation;
  final String city;
  final String conference;
  final String division;
  @JsonKey(name: 'full_name')
  final String fullName;
  final String name;

  factory NbaTeam.fromJson(Map<String, dynamic> json) => _$NbaTeamFromJson(json);
  Map<String, dynamic> toJson() => _$NbaTeamToJson(this);

}

//"id": 1,
//"abbreviation": "ATL",
//"city": "Atlanta",
//"conference": "East",
//"division": "Southeast",
//"full_name": "Atlanta Hawks",
//"name": "Hawks"