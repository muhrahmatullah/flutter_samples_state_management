import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_management_sample/presentations/home_screen_view.dart';
import 'package:state_management_sample/presentations/home_view_model.dart';
import 'package:state_management_sample/redux/app_actions.dart';
import 'package:state_management_sample/redux/app_state.dart';

class HomeScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomeScreenViewModel>(
      distinct: true,
      converter: (store) => HomeScreenViewModel(store),
      builder: (_, viewModel) {
        return HomeScreenViewRedux(vm: viewModel, onInit: () {
          StoreProvider.of<AppState>(context).dispatch(FetchTeamsAction());
        },);
      },
    );
  }
}

