class CategorieModel {
  int? categorieId;
  String? categorieImage;
  String? categorieNameEn;
  String? categorieNameAr;
  String? categorieCreatedDate;

  CategorieModel({
    this.categorieId,
    this.categorieImage,
    this.categorieNameEn,
    this.categorieNameAr,
    this.categorieCreatedDate,
  });

  CategorieModel.fromJson(Map<String, dynamic> json) {
    categorieId = json['categorie_id'];
    categorieImage = json['categorie_image'];
    categorieNameEn = json['categorie_name_en'];
    categorieNameAr = json['categorie_name_ar'];
    categorieCreatedDate = json['categorie_created_date'];
  }

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = Map<String, dynamic>();
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categorie_id'] = categorieId;
    data['categorie_image'] = categorieImage;
    data['categorie_name_en'] = categorieNameEn;
    data['categorie_name_ar'] = categorieNameAr;
    data['categorie_created_date'] = categorieCreatedDate;
    return data;
  }
}
