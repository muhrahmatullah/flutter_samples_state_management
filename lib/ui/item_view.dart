import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_management_sample/model/team.dart';

class NbaItemView extends StatelessWidget {

  const NbaItemView({Key key, this.data}) : super(key: key);

  final NbaTeam data;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(data.fullName, style: Theme.of(context).textTheme.headline6,),
        subtitle: Text(data.city),
        trailing: Text(data.conference),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(data.abbreviation),
          ],
        ),
      ),
    );
  }
}
