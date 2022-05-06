class UserModel {
  UserModel({
    this.id = 0,
    required this.name,
    required this.gender,
    required this.image,
  });

  int id;
  String name;
  String gender;
  String image;

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "image": image,
      };
}
