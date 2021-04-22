class UserModel {
  String name;
  String photoUrl;
  final int score;
  
  UserModel({
    required this.name,
    required this.photoUrl,
    this.score = 0,
  });
}
