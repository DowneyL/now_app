class UserModel {
  String name;
  String avatar;

  UserModel({this.name, this.avatar});

  UserModel.fromJson(Map<String, dynamic> data) {
    name = data["name"];
    avatar = data["avatar"];
  }
}
