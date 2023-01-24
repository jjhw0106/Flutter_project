import 'package:dev_test/ui/main/popup/getpoint_popup.dart';
import 'package:flutter/material.dart';

class PopupMain extends StatelessWidget {
  // const PopupMain({Key? key}) : super(key: key);

  int pointType=1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('팝업메뉴'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: (){
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return GetPointDialog();
                      },
                  );
                },
                child: ButtonBar(
                  children: [
                    Text("버튼")
                  ],
                )
            ),
            ElevatedButton(
                onPressed: (){},
                child: ButtonBar(
                  children: [
                    Text("버튼")
                  ],
                )
            ),
            ElevatedButton(
                onPressed: (){},
                child: ButtonBar(
                  children: [
                    Text("버튼")
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
