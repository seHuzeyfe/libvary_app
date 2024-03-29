
import 'package:flutter/widgets.dart';
import 'package:libvary_app/View/add_book_screen/add_book_screen.dart';
import 'package:libvary_app/View/book_screen/book_screen.dart';
import 'package:libvary_app/View/chats_screen/chats_screen.dart';
import 'package:libvary_app/View/forget_password_screen/forget_password_screen.dart';
import 'package:libvary_app/View/main_screen/main_screen.dart';
import 'package:libvary_app/View/profile_Screen/profile_screen.dart';
import 'package:libvary_app/View/sign_in_screen/sign_in_screen.dart';
import 'package:libvary_app/View/welcome_screen/welcome_screen.dart';
import 'package:libvary_app/View/sign_up_screen/sign_up_screen.dart';
import 'package:libvary_app/View/wishlist_screen/wishlist_screen.dart';
import 'navigation_bar.dart';

final Map<String , WidgetBuilder> routes ={
  WelcomeScreen.routeName : (context) => WelcomeScreen(),
  SignInScreen.routeName : (context) => SignInScreen(),
  ForgetPasswordScreen.routeName : (context) => ForgetPasswordScreen(),
  SignUpScreen.routeName : (context) => SignUpScreen(),
  MainScreen.routeName : (context) => MainScreen(),
  MainNavigationBar.routeName : (context) => MainNavigationBar(),
  BookAddPage.routeName : (context) => BookAddPage(),
  ProfileScreen.routeName : (context) => ProfileScreen(),
  DetailsScreen.routeName : (context) => DetailsScreen(),
  WishListScreen.routeName : (context) => WishListScreen(),
  ChatsScreen.routeName :(context) => ChatsScreen(),
};