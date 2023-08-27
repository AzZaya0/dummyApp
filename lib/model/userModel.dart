class UserModel {
  UserModel({
    required this.username,
    required this.email,
    required this.photoUrl,
    required this.number,
  });
  late String username;
  late String email;
  late String photoUrl;
  late String number;

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['photoUrl'] = photoUrl;
    _data['number'] = number;
    return _data;
  }
}
