// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'models/post_model.dart';
import 'ui/home_screen.dart';
import 'ui/home_screen_new.dart';
import 'ui/login/loginPage.dart';
import 'ui/login/profile_two_page.dart';
import 'ui/login/screens/post_screen.dart';
import 'ui/login/signup.dart';
import 'ui/login/wlecom.dart';
import 'ui/posting.dart';

class Routes {
  static const String welcomePage = '/';
  static const String signUpPage = '/sign-up-page';
  static const String loginPage1 = '/login-page1';
  static const String homeScreen = '/home-screen';
  static const String profileTwoPage = '/profile-two-page';
  static const String homePage = '/home-page';
  static const String postScreen = '/post-screen';
  static const String posting = '/Posting';
  static const all = <String>{
    welcomePage,
    signUpPage,
    loginPage1,
    homeScreen,
    profileTwoPage,
    homePage,
    postScreen,
    posting,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.welcomePage, page: WelcomePage),
    RouteDef(Routes.signUpPage, page: SignUpPage),
    RouteDef(Routes.loginPage1, page: LoginPage1),
    RouteDef(Routes.homeScreen, page: HomeScreen),
    RouteDef(Routes.profileTwoPage, page: ProfileTwoPage),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.postScreen, page: PostScreen),
    RouteDef(Routes.posting, page: Posting),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    WelcomePage: (data) {
      final args = data.getArgs<WelcomePageArguments>(
        orElse: () => WelcomePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => WelcomePage(
          key: args.key,
          title: args.title,
        ),
        settings: data,
      );
    },
    SignUpPage: (data) {
      final args = data.getArgs<SignUpPageArguments>(
        orElse: () => SignUpPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpPage(
          key: args.key,
          title: args.title,
        ),
        settings: data,
      );
    },
    LoginPage1: (data) {
      final args = data.getArgs<LoginPage1Arguments>(
        orElse: () => LoginPage1Arguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginPage1(
          key: args.key,
          title: args.title,
        ),
        settings: data,
      );
    },
    HomeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeScreen(),
        settings: data,
      );
    },
    ProfileTwoPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileTwoPage(),
        settings: data,
      );
    },
    HomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
      );
    },
    PostScreen: (data) {
      final args = data.getArgs<PostScreenArguments>(
        orElse: () => PostScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => PostScreen(question: args.question),
        settings: data,
      );
    },
    Posting: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Posting(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// WelcomePage arguments holder class
class WelcomePageArguments {
  final Key key;
  final String title;
  WelcomePageArguments({this.key, this.title});
}

/// SignUpPage arguments holder class
class SignUpPageArguments {
  final Key key;
  final String title;
  SignUpPageArguments({this.key, this.title});
}

/// LoginPage1 arguments holder class
class LoginPage1Arguments {
  final Key key;
  final String title;
  LoginPage1Arguments({this.key, this.title});
}

/// PostScreen arguments holder class
class PostScreenArguments {
  final Question question;
  PostScreenArguments({this.question});
}
