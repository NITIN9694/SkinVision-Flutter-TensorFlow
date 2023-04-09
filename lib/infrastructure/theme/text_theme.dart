import 'package:flutter/material.dart';


regularTextStyle({required fontSize,required color,height,overflow}) {
  return TextStyle(fontSize: fontSize, color: color,fontWeight: FontWeight.w400,height: height,overflow: overflow);
}

mediumTextStyle({required fontSize,required color,height,overflow}) {
  return TextStyle(fontSize: fontSize, color: color,fontWeight: FontWeight.w500,overflow: overflow);
}

/*semiBoldTextStyle({required fontSize,required color,height}) {
  return TextStyle(fontSize: fontSize, color: color,fontWeight: FontWeight.w600);
}*/

boldTextStyle({required fontSize,required color,height,overflow}) {
  return TextStyle(fontSize: fontSize, color: color,fontWeight: FontWeight.w600,overflow:overflow);
}

appBarTextStyle({fontSize,required color,overflow}) {
  return TextStyle(fontSize: fontSize??dimen20, color: color,fontWeight: FontWeight.w600);
}

// font size
var dimen8 = 8.0;
var dimen9 = 9.0;
var dimen10 = 10.0;
var dimen11 = 11.0;
var dimen12 = 12.0;
var dimen13 = 13.0;
var dimen14 = 14.0;
var dimen15 = 15.0;
var dimen16 = 16.0;
var dimen17 = 17.0;
var dimen18 = 18.0;
var dimen19 = 19.0;
var dimen20 = 20.0;
var dimen21 = 21.0;
var dimen22 = 22.0;
var dimen23 = 23.0;
var dimen24 = 24.0;
var dimen25 = 25.0;
var dimen26 = 26.0;
var dimen27 = 27.0;
var dimen28 = 28.0;
