import 'package:geeksynergy_assesment/models/user_model.dart';
import 'package:geeksynergy_assesment/utils/shared_prefs.dart';
import 'package:get/get.dart';
import 'package:objectbox/objectbox.dart';
import '../objectbox.g.dart';
import 'package:collection/collection.dart';

class UserBox {
  late final Store _store;
  late final Box<UserModel> _userBox;

  UserBox._init(this._store) {
    _userBox = Box<UserModel>(_store);
  }

  static Future<UserBox> init() async {
    final store = await openStore();
    return UserBox._init(store);
  }

  close() {
    _store.close();
  }

  UserModel? getUser(int id) => _userBox.get(id);
  List<UserModel>? getAllUser() => _userBox.getAll();
  Future<bool> addUser(UserModel newUser) async{
    var res = false;
    final allUser = getAllUser();
    if ((allUser!.firstWhereOrNull(
          (user) => user.email == newUser.email,
        )) !=
        null) {
      Get.snackbar('User Exists', "User with the same email id Exists");
      res = false;
    } else {
      _userBox.put(newUser);
   
      res = true;
         Get.snackbar('Signup Success', "User has been created");
    }
    return res;
  }

  bool deleteUser(int id) => _userBox.remove(id);
  int deleteAllUser() => _userBox.removeAll();
}
