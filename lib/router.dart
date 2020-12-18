import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';
import 'package:software_technology/ui/home_screen_new.dart';
import 'package:software_technology/ui/login/profile_two_page.dart';
import 'package:software_technology/ui/login/screens/post_screen.dart';
import 'package:software_technology/ui/posting.dart';

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
    MaterialRoute(page: ProfileTwoPage, ),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: PostScreen),
    MaterialRoute(page: Posting)
    
    
  ],
)
class $Router {}
