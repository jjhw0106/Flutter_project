import 'package:dev_test/controller/workbook/set_study_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

class SetStudyType extends StatefulWidget {
  // const SetStudyType({super.key});

  const SetStudyType({super.key});

  @override
  State<SetStudyType> createState() => _SetStudyTypeState();
}

class _SetStudyTypeState extends State<SetStudyType> {
  final _textController = TextEditingController();
  
  String appName = dotenv.get("KAKAO_REST_KEY");
  
  @override
  Widget build(BuildContext context) {
    final studyController = Provider.of<SetStudyController>(context, listen:false);
    return Scaffold(
      appBar: AppBar(title: const Text("Search Subject!!")),
      body: Column(
        children: [
          const SizedBox(height: 10),
          TextField(
            controller: _textController,
            onSubmitted: (value) {
              // studyController.searchTextList.add(value);
              studyController.setBookInfosList();
              _textController.text = '';
              setState(() {});
            },
            // onChanged: (value) {},
            decoration: const InputDecoration(
              hintText: "찾으실 교재명을 적어주세요",
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              suffixIcon: Icon(Icons.search),
            ),
          ),
          Text(appName),
          Expanded(
            child: ListView.builder(
              itemCount: studyController.searchTextList.length,
              itemBuilder: (context, index) {
                return Text(studyController.searchTextList[index]);
              },
            ),
          ),
          Row(
            children: const [
              Text("ff"),
              Text("ff"),
              Text("ff"),
            ],
          ),
        ],
      ),
    );
  }
}
