import 'package:dev_test/controller/workbook/set_study_controller.dart';
import 'package:flutter/material.dart';

class SetStudyType extends StatefulWidget {
  // const SetStudyType({super.key});

  const SetStudyType({super.key});

  @override
  State<SetStudyType> createState() => _SetStudyTypeState();
}

class _SetStudyTypeState extends State<SetStudyType> {
  final _textController = TextEditingController();
  final _studyController = SetStudyController();
  // List<String> searchTextList = [];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Subject!!")),
      body: Column(
        children: [
          const SizedBox(height: 10),
          TextField(
            controller: _textController,
            onSubmitted: (value) {
              _studyController.searchTextList.add(value);
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
          Expanded(
            child: ListView.builder(
              itemCount: _studyController.searchTextList.length,
              itemBuilder: (context, index) {
                return Text(_studyController.searchTextList[index]);
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
