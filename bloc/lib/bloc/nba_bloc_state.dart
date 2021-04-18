import 'package:equatable/equatable.dart';
import 'package:state_management_sample/model/team.dart';

abstract class NbaBlocState extends Equatable {
  const NbaBlocState();

  @override
  List<Object?> get props => [];
}

class Loading extends NbaBlocState {}

class Error extends NbaBlocState {}

class Succes extends NbaBlocState {
  const Succes(this.data);

  final List<NbaTeam>? data;

  Succes copyWith({List<NbaTeam>? data}) {
    return Succes(data ?? this.data);
  }


  @override
  List<Object?> get props => [data];

}
