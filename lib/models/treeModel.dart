class TreeModel {
  List<Data> data=[];
  String? error;

  TreeModel({required this.data});


  TreeModel.withError(String msg){
    error=msg;
  }

  TreeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? categoryId;
  String? imageUrl;
  String? name;
  String? rating;
  int? displaySize;
  List<int>? availableSize;
  String? unit;
  String? price;
  String? priceUnit;
  String? description;

  Data(
      {required this.id,
        required this.categoryId,
        required this.imageUrl,
        required this.name,
        required this.rating,
        required this.displaySize,
        required this.availableSize,
        required this.unit,
        required this.price,
        required this.priceUnit,
        required this.description});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    imageUrl = json['image_url'];
    name = json['name'];
    rating = json['rating'].toString();
    displaySize = json['display_size'];
    availableSize = json['available_size'].cast<int>();
    unit = json['unit'];
    price = json['price'];
    priceUnit = json['price_unit'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['image_url'] = this.imageUrl;
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['display_size'] = this.displaySize;
    data['available_size'] = this.availableSize;
    data['unit'] = this.unit;
    data['price'] = this.price;
    data['price_unit'] = this.priceUnit;
    data['description'] = this.description;
    return data;
  }
}
