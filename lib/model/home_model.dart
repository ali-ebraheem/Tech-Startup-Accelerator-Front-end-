class HomeModel {
  List<String>? images;
  House? house;

  HomeModel({this.images, this.house});

  HomeModel.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
    house = json['house'] != null ? House.fromJson(json['house']) : null;
  }
}

class House {
  List<String>? houseName;

  House({this.houseName});

  House.fromJson(Map<String, dynamic> json) {
    houseName = json['houseName'].cast<String>();
  }

}