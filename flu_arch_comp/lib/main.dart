import 'package:flu_arch_comp/data/remote/app_client.dart';
import 'package:flu_arch_comp/data/repository.dart';
import 'package:flu_arch_comp/ui/home_screen.dart';
import 'package:flu_arch_comp/ui/home_screen_v2.dart';
import 'package:flu_arch_comp/ui/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Arch comp Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeViewModel>(
            create: (context) => HomeViewModel(Repository(AppClientService())),
          )
        ],
        child: HomeScreenV2(),
      ),
    );
  }
}
