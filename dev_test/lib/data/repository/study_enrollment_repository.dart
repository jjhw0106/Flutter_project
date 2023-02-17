import 'package:dev_test/data/provider/study_enrollment_provider.dart';

class StudyEnrollmentRepository {
  final StudyEnrollmentProvider _setStudyProvider;
  StudyEnrollmentRepository(this._setStudyProvider);

  Future<dynamic> getBookInfos(String? title) async {
    return _setStudyProvider.getBooksFromKakao(title);
  }
}