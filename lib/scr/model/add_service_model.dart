class AddServiceModel {
  AddServiceModel({
    this.id = 0,
    required this.userId,
    required this.type,
  });

  int id;
  int userId;
  int type;

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "type": type,
      };
}
