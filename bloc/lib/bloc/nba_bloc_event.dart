import 'package:equatable/equatable.dart';

abstract class NbaBlocEvent extends Equatable {

  @override
  List<Object?> get props => [];

}

class FetchDataEvent extends NbaBlocEvent {

}

class FetchMoreDataEvent extends NbaBlocEvent {}
