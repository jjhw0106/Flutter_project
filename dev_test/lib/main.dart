import 'package:dev_test/controller/point/randombox_controller.dart';
import 'package:dev_test/controller/workbook/study_enrollment_controller.dart';
import 'package:dev_test/controller/workbook/study_type_selection_controller.dart';
import 'package:dev_test/data/model/point_dialog_message.dart';
import 'package:dev_test/data/provider/study_enrollment_provider.dart';
import 'package:dev_test/data/repository/study_enrollment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
            StudyEnrollmentController(StudyEnrollmentRepository(StudyEnrollmentProvider()))),
    ChangeNotifierProvider<StudyTypeSelectionController>(
        create: (_) =>
            StudyTypeSelectionController()),
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
        // 지역 별 언어 제공
        localizationsDelegates: [
          // Flutter의 표준 Material Design위젯인 버튼, 텍스트, 대화 상자 같은 위젯에 대한 번역
          GlobalMaterialLocalizations.delegate,
          // Material design이 아닌 Cupertino와 같은 3자 위젯에 대한 번역
          GlobalWidgetsLocalizations.delegate,
          // IOS 위젯과 같은 모양을 갖는 Cupertino위젯의 번역 제공
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ko'),
          Locale('en'),
        ],
      ),
    );
  }
}