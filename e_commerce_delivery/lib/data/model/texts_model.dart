class TextModel {
  int? textId;
  String? textName;
  String? textEn;
  String? textAr;

  TextModel({
    this.textId,
    this.textName,
    this.textEn,
    this.textAr,
  });

  TextModel.fromJson(Map<String, dynamic> json) {
    textId = json['text_id'];
    textName =json['text_name'] ;
    textEn = json['text_en'];
    textAr = json['text_ar'];
  }
}
