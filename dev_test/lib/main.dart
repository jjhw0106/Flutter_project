import 'package:dev_test/controller/point/randombox_controller.dart';
import 'package:dev_test/controller/workbook/study_enrollment_controller.dart';
import 'package:dev_test/data/model/point_dialog_message.dart';
import 'package:dev_test/data/provider/study_enrollment_provider.dart';
import 'package:dev_test/data/repository/study_enrollment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'ui/home.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static final providers = [
    ChangeNotifierProvider<RandomBoxController>(
        create: (_) => RandomBoxController(PointDialogMessage())),
    ChangeNotifierProvider<StudyEnrollmentController>(
        create: (_) =>
            StudyEnrollmentController(StudyEnrollmentRepository(StudyEnrollmentProvider())))
  ];
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MyApp.providers,
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}