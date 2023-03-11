// UI 공통 사용 개념 정리
enum UiHelpers {
  // 이전페이지
  prev,
  // 다음페이지
  next,
}

enum SelectedType {
  bookType,
  videoType,
  nothing
}
// 후보 학습 계획표 인덱스에 해당하는 enum value 리턴
enum StudyPlanCandidatesIdx {
  first(0),
  second(1),
  third(2),
  fourth(3);

  final int idx;

  const StudyPlanCandidatesIdx(this.idx);

  static StudyPlanCandidatesIdx getValue(int index) {
    return StudyPlanCandidatesIdx.values.firstWhere((element) => element.idx == index);
  }
}

// 학습 계획표 과목별 색깔
enum StudyPlanSubjectColor {
  first(1, 0xfffceef4),
  second(2, 0xfff1f6eb),
  third(3, 0xfffdfcea),
  fourth(4, 0xffedf7fd),
  fifth(5, 0xfff3ecf8),
  sixth(6, 0xfffff4e8);

  final int subjectCode;
  final int subjectColor;

  const StudyPlanSubjectColor(this.subjectCode, this.subjectColor);

  static int getColor(int subjectCode) {
    return StudyPlanSubjectColor.values.firstWhere((element) => element.subjectCode == subjectCode).subjectColor;
  }
}

