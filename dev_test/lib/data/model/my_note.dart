class MyNote{
  late int? Idx;
  late int? SubjectCode;
  late String? LearningType;
  late String? LearningCode;
  late String? Title;
  late String? Contents;
  late String? RegDate;

  MyNote({this.Idx, this.SubjectCode, this.LearningType, this.LearningCode, this.Title, this.Contents, this.RegDate});

  MyNote.fromMap(Map<String, dynamic> mapItem)
    : Idx = mapItem["Idx"],
      SubjectCode = mapItem["SubjectCode"],
      LearningType = mapItem["LearningType"],
      LearningCode = mapItem["LearningCode"],
      Title = mapItem["Title"],
      Contents = mapItem["Contents"],
      RegDate = mapItem["RegDate"]
      ;
}