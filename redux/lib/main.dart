import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:state_management_sample/presentations/view.dart';
import 'package:state_management_sample/redux/app_middleware.dart';
import 'package:state_management_sample/redux/app_reducer.dart';
import 'package:state_management_sample/redux/app_state.dart';
import 'package:state_management_sample/service/net_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: Store<AppState>(appReducer, initialState: AppState(nbaTeamResponse: null), middleware: createMiddleware(NbaTeamService())),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MultiProvider(providers: [Provider<NbaTeamService>.value(value: NbaTeamService())], child: HomeScreenView()),
      ),
    );
  }
}
