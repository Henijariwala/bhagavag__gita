import 'package:bhagavad_gita/screen/detail/detail_screen.dart';
import 'package:bhagavad_gita/screen/home/view/home_screen.dart';
import 'package:bhagavad_gita/screen/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String , WidgetBuilder> app_routes ={
  '/':(context) =>const SplashScreen(),
  'home':(context) =>const HomeScreen(),
  'detail':(context) =>const DetailScreen(),
};