import 'package:dev_test/data/repository/study_enrollment_repository.dart';
import 'package:flutter/cupertino.dart';

class StudyEnrollmentController with ChangeNotifier {
  late dynamic searchTextList;
  final StudyEnrollmentRepository setStudyRepository;

  StudyEnrollmentController(this.setStudyRepository);

  bool isLoading = false;
  String title = "";

  Future<void> onInit(context) async {
    isLoading=true;
    print("controller setting...");
    searchTextList = <dynamic>[];
    isLoading =false; 
  }
  
  Future<dynamic> setBookInfoList(String? title) async {
    searchTextList = await setStudyRepository.getBookInfos(title);
    isLoading=false;
    notifyListeners();
  }
}
