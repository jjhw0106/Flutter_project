import 'package:dev_test/controller/point_dialog_controller.dart';
import 'package:flutter/material.dart';

class PopupMain extends StatefulWidget {
  const PopupMain({super.key});

  @override
  State<PopupMain> createState() => _PopupMainState();
}

class _PopupMainState extends State<PopupMain> {
  // const PopupMain({Key? key}) : super(key: key);
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  PointDialogController controller = PointDialogController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('팝업메뉴'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                // 포인트 저장 메소드-> 저장성공시 아래 진행(validation)
                // 메시지 전달
                // print(controller.pointType);
                onPressed: () => controller.callDialog(context),
                child: const ButtonBar(
                  children: [Text("버튼")],
                )),
            ElevatedButton(
                onPressed: () {},
                child: const ButtonBar(
                  children: [Text("버튼")],
                )),
            ElevatedButton(
                onPressed: () {},
                child: const ButtonBar(
                  children: [Text("버튼")],
                )),
          ],
        ),
      ),
    );
  }
}
