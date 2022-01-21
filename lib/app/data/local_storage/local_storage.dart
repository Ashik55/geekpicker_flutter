import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final box = GetStorage();

  String userEmail = 'userEmail';
  String userPassword = 'userPassword';

  setUserEmail(String? value) {
    box.write(userEmail, value);
  }

  String? getUserEmail() {
    return box.read(userEmail);
  }

  setUserPass(String? value) {
    box.write(userPassword, value);
  }

  String? getUserPass() {
    return box.read(userPassword);
  }
}
