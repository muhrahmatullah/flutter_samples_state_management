import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_sample/bloc/bloc.dart';
import 'package:state_management_sample/service/net_service.dart';
import 'package:state_management_sample/ui/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bloc Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocProvider(
          create: (context) =>
              NbaBloc(service: NbaTeamService())..add(FetchDataEvent()),
          child: HomeScreen(),
        ));
  }
}
