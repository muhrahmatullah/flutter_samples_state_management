import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:state_management_sample/model/nba_team_response.dart';
import 'package:state_management_sample/service/net_service.dart';
import 'package:state_management_sample/ui/item_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NbaTeamResponse response = NbaTeamResponse();

  ScrollController scrollController = ScrollController();

  bool isLoading = false;

  bool canLoad = false;

  int page = 1;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await fetchNbaTeams(page, context);
    });
  }

  Future<void> fetchNbaTeams(int p, BuildContext context) async {
    final res = await Provider.of<NbaTeamService>(context, listen: false).fetchTeams(p, perPage: 10);
    setState(() {
      if(page > 1) {
        response.data.addAll(res.data);
      } else {
        response = res;
      }
      if(response.meta.totalPage > p) {
        page++;
        canLoad = true;
      } else {
        canLoad = false;
      }
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if(isLoading || !canLoad) {
          return;
        }
        setState(() {
          isLoading = true;
          canLoad = false;
        });
        Future.microtask(() async{
          await fetchNbaTeams(page, context);
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Nba team'),
      ),
      body: response == null
          ? Center(child: Text('Network request failed'))
          : response.data == null
          ? Center(child: CircularProgressIndicator())
          : Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemBuilder: (ctx, idx) => NbaItemView(data: response.data[idx],),
                itemCount: response.data.length,
              ),
            ),
            Center(child: Container(child: isLoading ? CircularProgressIndicator(): SizedBox()))
          ],
        ),
      ),
    );
  }
}
