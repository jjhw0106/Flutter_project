import 'package:dev_test/ui/point/random_box.dart';
import 'package:dev_test/ui/workbook/study_type_selection.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RandomBox()));
              }, 
              child: const Text("RandomBox")
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const StudyTypeSelection()));
              }, 
              child: const Text("SetStudytype")
            ),
          ],
        ),
      ),
    );
  }
} 