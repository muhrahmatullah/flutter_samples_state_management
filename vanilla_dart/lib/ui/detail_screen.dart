import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_management_sample/model/team.dart';

class NbaTeamDetailScreen extends StatelessWidget {
  const NbaTeamDetailScreen({Key key, this.data}) : super(key: key);

  final NbaTeam data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.fullName),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                data.fullName,
                style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black),
              ),
              Text(
                data.city,
                style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.black),
              ),
              Text(
                data.conference,
                style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
