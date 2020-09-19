enum UserType{PARTICULAR,PROFESSIONAL}
class User{
  final String id;
  final String name;
  final String contact;
  final String mail;
  final String password;
  final UserType userType;
  final DateTime createdAt;

  User({this.id,this.name, this.contact, this.mail, this.password, this.userType = UserType.PARTICULAR, this.createdAt});

  @override
  String toString() {
    return 'User{id: $id, name: $name, contact: $contact, mail: $mail, password: $password, userType: $userType, createdAt: $createdAt}';
  }
}