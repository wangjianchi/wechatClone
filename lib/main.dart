import 'package:flutter/material.dart';
import 'package:wechat_clone/home/home_screen.dart';
import 'constants.dart' show AppColors;

void main() => runApp(MaterialApp(
  title:'微信',
  theme: ThemeData.light().copyWith(
    primaryColor: Color(AppColors.AppBarColor),
    cardColor: Color(AppColors.AppBarColor)
  ),
  debugShowCheckedModeBanner: false,
  home:HomeScreen()
));

