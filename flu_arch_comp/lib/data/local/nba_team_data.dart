import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

class NbaTeamData extends Table {


  IntColumn get dbid => integer().autoIncrement()();
  IntColumn get id => integer()();
  TextColumn get abbreviation => text()();
  TextColumn get city => text()();
  TextColumn get conference => text()();
  TextColumn get division => text()();
  TextColumn get fullName => text()();
  TextColumn get name => text()();



}