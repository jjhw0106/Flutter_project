
import 'package:dev_test/data/provider/study_enrollment_provider.dart';

class StudyEnrollmentRepository {
  final StudyEnrollmentProvider _studyEnrollmentProvider;

  StudyEnrollmentRepository(this._studyEnrollmentProvider);

  Future<List<dynamic>> getBookInfos(String? title) async {
    return _studyEnrollmentProvider.getBooksFromKakao(title);
  }

  Future<String> saveMyWorkbook(String param) async{
    return _studyEnrollmentProvider.saveMyWorkbook(param);
  }
}