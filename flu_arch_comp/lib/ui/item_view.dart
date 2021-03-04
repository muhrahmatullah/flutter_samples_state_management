import 'package:flu_arch_comp/model/team.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class NbaItemView extends StatelessWidget {

  const NbaItemView({Key key, this.data}) : super(key: key);

  final NbaTeam data;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(data.fullName, style: Theme.of(context).textTheme.headline6,),
        subtitle: Text(data.city),
        trailing: Text('${data.conference} Conf'),
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