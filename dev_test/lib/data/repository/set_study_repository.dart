import 'package:dev_test/data/provider/set_study_provider.dart';

class SetStudyRepository{
  final SetStudyProvider _setStudyProvider;
  SetStudyRepository(this._setStudyProvider);

  Future<List<dynamic>> getBookInfos() async {
    return _setStudyProvider.getBooksFromKakao();
  }
}