import 'package:dev_test/ui/point/random_box.dart';
import 'package:dev_test/ui/workbook/set_study_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    String appName = dotenv.get("KAKAO_REST_KEY");
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RandomBox()));
            }, child: Text(appName)),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SetStudyType()));
            }, child: const Text("SetStudytype"))
          ],
        ),
      ),
    );
  }
} 