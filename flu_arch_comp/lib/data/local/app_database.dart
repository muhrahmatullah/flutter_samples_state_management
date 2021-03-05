import 'package:flu_arch_comp/data/local/nba_team_data.dart';
import 'package:flu_arch_comp/model/team.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'app_database.g.dart';

@UseMoor(tables: [NbaTeamData])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'nba.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future insertTeams(List<NbaTeam> list) async {
    await batch((batch) {
      batch.insertAll(
          nbaTeamData,
          list.map((data) => NbaTeamDataCompanion.insert(
                id: data.id,
                abbreviation: data.abbreviation,
                city: data.city,
                conference: data.conference,
                division: data.division,
                fullName: data.fullName,
                name: data.name,
              )).toList(),);
    });
  }

  Future<List<NbaTeamDataData>> fetchAll() => select(nbaTeamData).get();
}
