class UserModel {
  final String name;
  final String email;
  final String password;
  final String firstname;
  final String lastname;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
  });

  Map<String, dynamic> toJson() {
  return {
    "username": name,
    "email": email,
    "password": password,
    "first_name": firstname,
    "last_name": lastname,
  };
}
}
