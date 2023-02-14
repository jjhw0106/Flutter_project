import 'package:dev_test/data/repository/set_study_repository.dart';
import 'package:flutter/cupertino.dart';

class SetStudyController with ChangeNotifier {
  late dynamic searchTextList; // 위치 OK
  final SetStudyRepository setStudyRepository;

  SetStudyController(this.setStudyRepository);

  bool isLoading = false;
  String title = "";

  Future<void> onInit(context) async {
    isLoading=true;
    print("controller setting...");
    searchTextList = <dynamic>[];
    isLoading =false; 
    print("isLoading: $isLoading" );
    // await setBookInfoList(title);
    // notifyListeners();
  }

  Future<dynamic> setBookInfoList(String? title) async {
    print("controller!!");
    searchTextList = await setStudyRepository.getBookInfos(title);
    isLoading=false;
    notifyListeners();
  }
}
