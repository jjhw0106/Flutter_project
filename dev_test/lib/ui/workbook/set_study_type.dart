import 'dart:ui';

import 'package:dev_test/controller/workbook/set_study_controller.dart';
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
  late SetStudyController studyController;
  late dynamic bookList;
  String noSearchMessage = "학습할 교재명을 검색해주세요!";
  String appName = dotenv.get("KAKAO_REST_KEY");

  @override
  void initState() {
    super.initState();
    studyController = Provider.of<SetStudyController>(context, listen: false);
    studyController.onInit(context);
  }

  @override
  Widget build(BuildContext context) {
    studyController = context.watch<SetStudyController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("문제집 등록", style: TextStyle(color: Colors.purple,fontSize: 27.1, fontWeight: FontWeight.bold))),
      body: !studyController.isLoading
          ? Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _textController,
                    onSubmitted: (value) {
                      // studyController.searchTextList.add(value);
                      studyController.setBookInfoList(_textController.text);
                      noSearchMessage = "검색 결과가 없습니다.";
                      print(_textController.text);
                      _textController.text = '';
                      setState(() {});
                    },
                    // onChanged: (value) {},
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: "찾으실 교재명을 적어주세요",
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  child: studyController.searchTextList.length == 0? Center(child: Text(noSearchMessage)): ListView.builder(
                    itemCount: studyController.searchTextList.length,
                    itemBuilder: (context, index) {
                      return bookItemContainer(studyController.searchTextList[index]['title']);
                    },
                  ),
                ),
              ],
            ) 
          : const Center(
              child: CircularProgressIndicator(
                // https://stackoverflow.com/questions/49952048/how-to-change-color-of-circularprogressindicator
                valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 175, 45, 45)),
                strokeWidth: 10.0,
              ),
            ),
    );
  }
}

Widget bookItemContainer(String title){
  return Container(child: Text(title));
}