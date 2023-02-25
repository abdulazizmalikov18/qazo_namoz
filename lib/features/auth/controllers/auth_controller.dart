import 'package:flutter/foundation.dart';
import 'package:qazo_namaz/core/utils/shard_pr.dart';

class AuthState extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void checkLoginStatus() async {
    _isLoggedIn = StorageRepository.getBool('isLoggedIn');
    notifyListeners();
  }

  void setLoggedInStatus(bool isLoggedIn) async {
    await StorageRepository.putBool(key: 'isLoggedIn', value: isLoggedIn);
    _isLoggedIn = isLoggedIn;
    notifyListeners();
  }
}
