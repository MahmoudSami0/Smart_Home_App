
class UsersModel {
  final String name;
  final String phone;
  final String photoUrl;
  final String uid;
  final String email;

  UsersModel({
    required this.uid,
    required this.name,
    required this.phone,
    required this.photoUrl,
    required this.email,
  });

  factory UsersModel.fromJson(dynamic jsonResponse) {
    return UsersModel(
      name: jsonResponse['displayName'],
      uid: jsonResponse['id'],
      phone: jsonResponse['phoneNumber'],
      email: jsonResponse['email'],
      photoUrl: jsonResponse['photoUrl'],
    );
  }
}
