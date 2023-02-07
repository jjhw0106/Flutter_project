import 'package:dev_test/controller/point/randombox_controller.dart';
import 'package:dev_test/data/model/point_dialog_message.dart';
import 'package:dev_test/ui/point/random_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final providers = [
    ChangeNotifierProvider<RandomBoxController>(create: (_) => RandomBoxController(PointDialogMessage()))
  ]; 
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: const MaterialApp (
        home: Home(),
      ),
    );
  }
}
