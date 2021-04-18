import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_sample/bloc/bloc.dart';
import 'package:state_management_sample/model/nba_team_response.dart';
import 'package:state_management_sample/ui/item_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ScrollController scrollController = ScrollController();

  late final NbaBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<NbaBloc>(context, listen: false);
    _bloc.add(FetchDataEvent());
  }

  @override
  Widget build(BuildContext context) {
//
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
      body: BlocBuilder<NbaBloc, NbaBlocState>(
        builder: (ctx, state) {
          if (state is Loading) {
            return Center(
              child: const CircularProgressIndicator(),
            );
          }

          if (state is Error) {
            return Center(
              child: const Text('Error just happened'),
            );
          }

          if (state is Succes) {
            return ListView.builder(
              controller: scrollController,
              itemBuilder: (ctx, idx) => NbaItemView(data: state.data![idx]),
              itemCount: state.data?.length,
            );
          }

          return Container();
        },
      ),
    );
  }
}
