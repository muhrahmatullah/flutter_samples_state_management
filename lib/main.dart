import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_sample/model/nba_team_response.dart';
import 'package:state_management_sample/service/net_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(providers: [Provider<NbaTeamService>.value(value: NbaTeamService())], child: MyHomePage(title: 'Nba Team')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NbaTeamResponse response = NbaTeamResponse();

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final res = await Provider.of<NbaTeamService>(context, listen: false).fetchTeams(1, 10);
      setState(() {
        response = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: response == null
          ? Center(child: Text('Network request failed'))
          : response.data == null
              ? Center(child: CircularProgressIndicator())
              : Container(
                  child: ListView.builder(
                    itemBuilder: (ctx, idx) => Text(response.data[idx].fullName),
                    itemCount: response.data.length,
                  ),
                ),
    );
  }
}
