class PostModel {
  PostModel({
    required this.image,
    required this.userID,
    required this.description,
    required this.lat,
    required this.createdAt,
    required this.city,
    required this.id,
    required this.location,
    required this.lon,
    required this.reward,
    required this.isLost,
    required this.title,
    required this.catId,
    required this.status,
  });
  late String image;
  late String catId;
  late String userID;
  late String title;
  late String description;
  late String createdAt;
  late String id;
  late String reward;
  late String location;
  late String city;
  late num lat;
  late num lon;
  late bool isLost;
  late String status;

  PostModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    userID = json['user_id'] ?? '';
    title = json['title'] ?? '';
    description = json['description'] ?? '';
    createdAt = json['created_at'] ?? '';
    id = json['id'] ?? '';
    city = json['city'] ?? '';
    location = json['location'] ?? '';
    catId = json['cat_id'] ?? '';
    reward = json['reward'] ?? 0;
    lat = json['lat'] ?? 0.0;
    lon = json['lon'] ?? 0.0;
    isLost = json['is_lost'] ?? true;
    status = json['status'] ?? "pending";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['user_id'] = userID;
    data['title'] = title;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['city'] = city;
    data['location'] = location;
    data['reward'] = reward;
    data['lat'] = lat;
    data['lon'] = lon;
    data['is_lost'] = isLost;
    data['cat_id'] = catId;
    data['status'] = status;
    return data;
  }
}
