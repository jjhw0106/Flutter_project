import 'package:dev_test/data/repository/set_study_repository.dart';
import 'package:flutter/cupertino.dart';

class SetStudyController with ChangeNotifier{
  late List<dynamic> searchTextList;
  final SetStudyRepository setStudyRepository;
  
  SetStudyController(this.setStudyRepository);
 
  Future<dynamic> setBookInfosList() async {
    searchTextList = await setStudyRepository.getBookInfos();
    
  }
}