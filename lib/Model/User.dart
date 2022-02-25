class User {
  int? id;
  String? name;
  String? price;
  String? currency;

  User({this.id, this.name , this.price , this.currency});

  User.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['currency'] = this.currency;
    return data;
  }
}