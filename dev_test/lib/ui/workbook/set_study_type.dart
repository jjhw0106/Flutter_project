import 'package:flutter/material.dart';

class SetStudyType extends StatefulWidget {
  // const SetStudyType({super.key});

  const SetStudyType({super.key});

  @override
  State<SetStudyType> createState() => _SetStudyTypeState();
}

class _SetStudyTypeState extends State<SetStudyType> {
  final _textController = TextEditingController();

  List<String> searchTextList = [];

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
              searchTextList.add(value);
              print(searchTextList.length);
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
              itemCount: searchTextList.length,
              itemBuilder: (context, index) {
                return Text("$index");
              },
            ),
          ),
          Row(
            children: const [
              Text("ff"),
              Text("ff"),
              Text("ff"),
            ],
          )
        ],
      ),
    );
  }
}
