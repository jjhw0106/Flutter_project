import 'package:dev_test/data/repository/set_study_repository.dart';
import 'package:flutter/cupertino.dart';

class SetStudyController with ChangeNotifier {
  late dynamic searchTextList; // 위치 OK
  final SetStudyRepository setStudyRepository;

  SetStudyController(this.setStudyRepository);

  Future<dynamic> setBookInfoList() async {
    print("controller!!");
    searchTextList = await setStudyRepository.getBookInfos();
  }
}
