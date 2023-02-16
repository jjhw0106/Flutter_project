import 'package:dev_test/controller/workbook/set_study_controller.dart';
import 'package:flutter/material.dart';
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

  // 검색결과 없을 시 중단 표시 문구
  String noSearchMessage = "학습할 교재명을 검색해주세요!";

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
        iconTheme: const IconThemeData(
        color: Colors.black, //change your color here
  ),
        elevation: 0,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text("문제집 등록", style: TextStyle(color: Colors.black,fontSize: 21.7, fontFamily: 'Noto_Sans_KR-bold',fontWeight: FontWeight.bold)),
        ),
      
      body: !studyController.isLoading
          ? GestureDetector(
            onTap: (){FocusManager.instance.primaryFocus?.unfocus();},
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: _textController,
                      onSubmitted: (value) => _searchBooks(),
                      decoration: InputDecoration(
                        hintText: "찾으실 교재명을 적어주세요",
                        isDense: true,
                        prefixIcon: Icon(Icons.search,size: 30),
                        suffix: Padding(
                          padding: const EdgeInsets.only(right: 20 ),
                          child: ElevatedButton(
                            onPressed: () => _searchBooks(), 
                            child: const Text("검색",style: TextStyle(color: Colors.black),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                            ),
                          ),
                        ),
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
              ),
          ) 
          : const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 175, 45, 45)),
                strokeWidth: 10.0,
              ),
            ),
    );
  }
  void _searchBooks(){
    noSearchMessage = "검색 결과가 없습니다.";
    studyController.setBookInfoList(_textController.text);
    _textController.text = '';
    setState(() {});
  }
}

Widget bookItemContainer(String title){
  return SizedBox(
    height: 70,
    width: 100,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(27.3, 0, 17.3, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 8,
            child: Text(
              title, 
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Noto_Sans_KR-Medium'),
                ),
          ),
          const Flexible(
            flex: 2,
            child: Icon(Icons.arrow_forward_ios_rounded)),
        ],
      ),
    ),
  );
}