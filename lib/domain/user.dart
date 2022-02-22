class User {

  User({
    required this.id,
    required this.name,
    this.email,
    this.phone
  });

  int id;
  String name;
  String? email;
  String? phone;

}
