import 'package:dev_test/data/repository/set_study_repository.dart';
import 'package:flutter/cupertino.dart';

class SetStudyController with ChangeNotifier {
  late dynamic searchTextList; // 위치 OK
  final SetStudyRepository setStudyRepository;

  SetStudyController(this.setStudyRepository);

  bool isLoading = true;

  void onInit(context) async {
    await setBookInfoList();
    if (searchTextList != null) isLoading = false;

    notifyListeners();
  }

  Future<dynamic> setBookInfoList() async {
    print("controller!!");
    searchTextList = await setStudyRepository.getBookInfos();
  }
}
