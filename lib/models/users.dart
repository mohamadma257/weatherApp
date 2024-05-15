class UserModel {
  UserModel({
    required this.image,
    required this.phone,
    required this.fname,
    required this.lname,
    required this.createdAt,
    required this.city,
    required this.id,
    required this.email,
    required this.pushToken,
  });
  late String image;
  late String phone;
  late String fname;
  late String lname;
  late String createdAt;
  late String id;
  late String city;
  late String email;
  late String pushToken;

  UserModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    phone = json['phone'] ?? '';
    fname = json['fname'] ?? '';
    lname = json['lname'] ?? '';
    createdAt = json['created_at'] ?? '';
    id = json['id'] ?? '';
    city = json['city'] ?? '';
    email = json['email'] ?? '';
    pushToken = json['push_token'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['phone'] = phone;
    data['fname'] = fname;
    data['lname'] = lname;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['city'] = city;
    data['email'] = email;
    data['push_token'] = pushToken;
    return data;
  }
}
