import 'package:auto_route/auto_route_annotations.dart';

import 'ui/home_screen.dart';
import 'ui/login/loginPage.dart';
import 'ui/login/signup.dart';
import 'ui/login/wlecom.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: WelcomePage, initial: true),
    MaterialRoute(page: SignUpPage, ),
    MaterialRoute(page: LoginPage1, ),
    MaterialRoute(page: HomeScreen, ),
    
  ],
)
class $Router {}
