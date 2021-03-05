import 'package:flu_arch_comp/ui/home_viewmodel.dart';
import 'package:flu_arch_comp/ui/item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreenV2 extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenV2> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await Provider.of<HomeViewModel>(context, listen: false).fetchTeams(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Arch Comp Demo'),
      ),
      body: Container(
        child: Consumer<HomeViewModel>(builder: (ctx, vm, child) {
          if (vm.list != null) {
            return ListView.builder(
              itemBuilder: (ctx, idx) => NbaItemView(data: vm.list[idx]),
              itemCount: vm.list.length,
            );
          }

          if (vm.teams.error) {
            return const Center(child: Text('Error Happened'));
          }

          return Center(
            child: Container(width: 42, height: 42, child: const CircularProgressIndicator()),
          );
        }),
      ),
    );
  }
}
