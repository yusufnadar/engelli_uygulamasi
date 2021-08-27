class UserModel {

  UserModel({this.id,this.name,this.profilePhoto,this.phoneNumber});

  var id;
  String name;
  String profilePhoto;
  var phoneNumber;


  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    profilePhoto: json['profilePhoto'],
    phoneNumber: json['phoneNumber'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "profilePhoto": profilePhoto,
    "phoneNumber": phoneNumber,
  };

}