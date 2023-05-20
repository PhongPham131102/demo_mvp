import '../../constants.dart';
import '../../di/injection.dart';
import '../../repository/auth/get_auth.dart';
import 'auth_contract.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPresenter {
  AuthContract _view;

  late GetAuthRepository _repository;

  AuthPresenter(this._view) {
    _repository = new Injector().contactRepository;
  }

  void checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
    uid = prefs.getString('uid') ?? '';
    if (token!.isNotEmpty) {
      print(token);
      bool checkToken = await _repository.checkToken(token!);
      ;
      if (checkToken) {
        _view.setIsLoading(1);
      } else {
        resetTokenAndUid();
      }
    } else {
      resetTokenAndUid();
    }
  }

  resetTokenAndUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', '');
    prefs.setString('uid', '');
    _view.setIsLoading(2);
  }
}
