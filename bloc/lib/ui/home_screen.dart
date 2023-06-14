import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_sample/bloc/bloc.dart';
import 'package:state_management_sample/ui/item_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<NbaBloc>().add(FetchDataEvent());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nba team'),
      ),
      body: BlocBuilder<NbaBloc, NbaBlocState>(
        builder: (ctx, state) {
          if (state.status == ScreenStatus.loading) {
            return Center(
              child: const CircularProgressIndicator(),
            );
          }

          if (state.status == ScreenStatus.error) {
            return Center(
              child: const Text('Error just happened'),
            );
          }

          if (state.status == ScreenStatus.data) {
            return ListView.builder(
              controller: _scrollController,
              itemBuilder: (ctx, idx) => idx >= state.data.length ? const BottomLoader() : NbaItemView(data: state.data[idx]),
              itemCount: state.hasNext ? state.data.length + 1 : state.data.length,
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}
