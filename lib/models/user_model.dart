import 'package:objectbox/objectbox.dart';

@Entity()
class UserModel {
  @Id()
  int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String proffession;
  final String password;
  UserModel(
    
      {
        this.id=0,
        required this.email,
      required this.phoneNumber,
      required this.proffession,
      required this.password,
      required this.name});
}
