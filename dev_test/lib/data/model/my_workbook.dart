class MyWorkbook {
  final int studyIdx;
  final int memNo;
  final int subjectCode;
  final String workbookName;
  final String isbn;
  final bool chkActive;
  final int learningRangeStart;
  final int learningRangeEnd;
  final String learningStartDate;
  final int weeks;
  final String learningEndDate;
  final String regDate;

  MyWorkbook(
    this.studyIdx,
    this.memNo,
    this.subjectCode,
    this.workbookName,
    this.isbn,
    this.chkActive,
    this.learningRangeStart,
    this.learningRangeEnd,
    this.learningStartDate,
    this.weeks,
    this.learningEndDate,
    this.regDate
  );

  MyWorkbook.fromMap(Map<String, dynamic> mapItem)
    : studyIdx = mapItem['StudyIdx'],
      memNo = mapItem['MemNo'],
      subjectCode = mapItem['SubjectCode'],
      workbookName = mapItem['WorkbookName'],
      isbn = mapItem['ISBN'],
      chkActive = mapItem['ChkActive'],
      learningRangeStart = mapItem['LearningRangeStart'],
      learningRangeEnd = mapItem['LearningRangeEnd'],
      learningStartDate = mapItem['LearningStartDate'],
      weeks = mapItem['Weeks'],
      learningEndDate = mapItem['LearningEndDate'],
      regDate = mapItem['RegDate'];
}