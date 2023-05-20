import 'package:frontend_flutter/repository/register/get_registers.dart';

import '../repository/auth/get_auth.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();
  GetAuthRepository get contactRepository {
    return new GetAuthRepository();
  }
  GetRegistersRepository get registerRepository{
    return new GetRegistersRepository();
  }
}
