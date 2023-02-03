import 'package:flutter/material.dart';
import 'package:our_school_client/controller/point/randombox_controller.dart';
import 'package:our_school_client/ui/point/point_dialog.dart';
import 'package:our_school_client/ui/point/point_dialog2.dart';
import 'package:provider/provider.dart';

class PointMain extends StatefulWidget {
  const PointMain({super.key});

  @override
  State<PointMain> createState() => _PointMainState();
}

class _PointMainState extends State<PointMain> {

  late RandomBoxController controller;
  // late PointDialog Message msg;

  @override
  void initState() {
    super.initState();
    controller = Provider.of(context, listen: false);
    controller.onInit(context);
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller = context.watch<RandomBoxController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('팝업메뉴'),
      ),
      body: !controller.isLoading ? Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  print("callDialog!!");
                  pointDialog2(context, controller.getMessage());
                },
                child: const ButtonBar(
                  children: [Text("포인트 지급")],
                )),
            ElevatedButton(
              onPressed: () {},
              child: const ButtonBar(
                children: [Text("버튼")],
              )
            ),
          ],
        ),
      ) : const Center(
        child: CircularProgressIndicator(
                  // https://stackoverflow.com/questions/49952048/how-to-change-color-of-circularprogressindicator
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xffffffff)),
                  strokeWidth: 10.0,
                  ),
      ),
    );
  }
}
