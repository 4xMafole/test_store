import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_store/app/app.dart';
import 'package:test_store/bootstrap.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // systemNavigationBarColor: theme.current.primaryColor,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  bootstrap(
    () => App(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository(),
    ),
  );
}
