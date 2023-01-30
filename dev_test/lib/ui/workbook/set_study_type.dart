import 'package:flutter/material.dart';

class SetStudyType extends StatelessWidget {
  // const SetStudyType({super.key});

  SetStudyType({super.key});
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Subject!!")),
      body: Column(
        children: [
          const SizedBox(height: 10),
          TextField(
            controller: _textController,
            decoration: const InputDecoration(
              hintText: "찾으실 교재명을 적어주세요",
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              suffixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: Container(color: Colors.amber),
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
