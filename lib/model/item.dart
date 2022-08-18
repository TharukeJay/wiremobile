import 'dart:convert';

class Item {
  String? result;
  List<Data>? data;

  Item({this.result, this.data});

  Item.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? sKU;
  String? name;
  String? brandName;
  String? mainImage;
  Price? price;
  List<String>? sizes;
  String? stockStatus;
  String? colour;
  String? description;

  Data(
      {this.id,
        this.sKU,
        this.name,
        this.brandName,
        this.mainImage,
        this.price,
        this.sizes,
        this.stockStatus,
        this.colour,
        this.description});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sKU = json['SKU'];
    name = json['name'];
    brandName = json['brandName'];
    mainImage = json['mainImage'];
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    sizes = json['sizes'].cast<String>();
    stockStatus = json['stockStatus'];
    colour = json['colour'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['SKU'] = sKU;
    data['name'] = name;
    data['brandName'] = brandName;
    data['mainImage'] = mainImage;
    if (price != null) {
      data['price'] = price!.toJson();
    }
    data['sizes'] = sizes;
    data['stockStatus'] = stockStatus;
    data['colour'] = colour;
    data['description'] = description;
    return data;
  }

  static String encode(List<Data> datas) => json.encode(
    datas.map((v) => v.toJson()).toList()
  );

  static List<Data> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<Data>((item) => Data.fromJson(item))
          .toList();

}

class Price {
  String? amount;
  String? currency;

  Price({this.amount, this.currency});

  Price.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currency'] = currency;
    return data;
  }
}