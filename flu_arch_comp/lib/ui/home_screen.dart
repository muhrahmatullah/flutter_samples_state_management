import 'package:flu_arch_comp/ui/home_viewmodel.dart';
import 'package:flu_arch_comp/ui/item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    Future(() async {
      await Provider.of<HomeViewModel>(context, listen: false).fetchTeams(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<HomeViewModel>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Arch Comp Demo'),
      ),
      body: Container(
        child: viewModel.teams.data != null
            ? ListView.builder(
                  itemBuilder: (ctx, idx) => NbaItemView(data: viewModel.teams.data.data[idx]),
                  itemCount: viewModel.teams.data.data.length,
                )
            : viewModel.teams.error
                ? Center(child: const Text('Error Happened'))
                : Center(
                    child: Container(
                    width: 42,
                    height: 42,
                    child: CircularProgressIndicator(),
                  )),
      ),
    );
  }
}
