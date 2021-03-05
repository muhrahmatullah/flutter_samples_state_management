import 'package:flu_arch_comp/data/repository.dart';
import 'package:flu_arch_comp/data/response_wrapper.dart';
import 'package:flu_arch_comp/model/team.dart';
import 'package:flutter/widgets.dart';

class HomeViewModel extends ChangeNotifier {

  HomeViewModel(this._repository);

  final Repository _repository;

  ResponseWrapper<List<NbaTeam>> teams = ResponseWrapper.loading();

  List<NbaTeam> get list => teams?.data;

  Future<void> fetchTeams(int page) async {
    teams = await _repository.fetchTeams(page);
    notifyListeners();
  }

}
