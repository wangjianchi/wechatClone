import 'package:flutter/cupertino.dart';

class AppColors{
  static const AppBarColor = 0xff303030;
  static const TabIconAcitve = 0xff46c11b; 
  static const TabIconNormal = 0xff999999;
  static const AppBarPopMenuColor = 0xffffffff;
}

class Constants{
  static const IconFontFamily = "appIconFont";
}

class AppIconFont{
  Icon buidIconFont(int iconName){
    return Icon(IconData(
                iconName,
                fontFamily: Constants.IconFontFamily,
              ));
  }
  IconData buidIconData(int iconName){
    return IconData(
                iconName,
                fontFamily: Constants.IconFontFamily,
              );
  }
}