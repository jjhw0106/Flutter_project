import 'package:dev_test/controller/randombox_controller.dart';
import 'package:dev_test/data/model/point_dialog_message.dart';
import 'package:dev_test/point/random_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => RandomBoxController(PointDialogMessage()),
        child: const RandomBox(),
      ),
    );
  }
}
