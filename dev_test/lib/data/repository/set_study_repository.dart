import 'package:dev_test/data/provider/set_study_provider.dart';

class SetStudyRepository {
  final SetStudyProvider _setStudyProvider;
  SetStudyRepository(this._setStudyProvider);

  Future<dynamic> getBookInfos(String? title) async {
    print("repository!!");
    return _setStudyProvider.getBooksFromKakao(title);
  }
}