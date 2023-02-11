import 'package:dev_test/data/repository/set_study_repository.dart';
import 'package:flutter/cupertino.dart';

class SetStudyController with ChangeNotifier {
  late List<dynamic> searchTextList; // 위치 OK
  final SetStudyRepository setStudyRepository;

  SetStudyController(this.setStudyRepository);

  Future<dynamic> setBookInfosList() async {
    print("check1");
    searchTextList = await setStudyRepository.getBookInfos();
  }
}
