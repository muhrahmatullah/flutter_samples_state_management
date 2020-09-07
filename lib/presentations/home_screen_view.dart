import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_management_sample/presentations/home_view_model.dart';
import 'package:state_management_sample/ui/item_view.dart';

class HomeScreenViewRedux extends StatefulWidget {
  const HomeScreenViewRedux({Key key, this.vm, this.onInit}) : super(key: key);

  final HomeScreenViewModel vm;

  final void Function() onInit;

  @override
  _HomeScreenViewReduxState createState() => _HomeScreenViewReduxState(vm);
}

class _HomeScreenViewReduxState extends State<HomeScreenViewRedux> {

  _HomeScreenViewReduxState(this.vm);

  final HomeScreenViewModel vm;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    scrollController.addListener(() {
//      if(scrollController.position.pixels == scrollController.position.maxScrollExtent) {
//        if(isLoading || !canLoad) {
//          return;
//        }
//        setState(() {
//          isLoading = true;
//          canLoad = false;
//        });
//        Future.microtask(() async{
//          await fetchNbaTeams(page, context);
//        });
//      }
//    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Nba team'),
      ),
      body: vm.isError
          ? Center(child: Text('Network request failed'))
          : vm.isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
//                controller: scrollController,
                itemBuilder: (ctx, idx) => NbaItemView(data: vm.teams[idx],),
                itemCount: vm.teams.length,
              ),
            ),
//            Center(child: Container(child: isLoading ? CircularProgressIndicator(): SizedBox()))
          ],
        ),
      ),
    );
  }
}
