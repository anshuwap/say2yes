import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';



appConfiguration(BuildContext context) {
  var width = context.width();
  var height = context.height();
  var diagonal = sqrt((width * width) + (height * height));
  var isTab = diagonal > 1100.0;
  // if (isTab) {
  //   bookViewHeight = tab_BookViewHeight;
  //   bookHeight = tab_bookHeight;
  //   bookWidth = tab_bookWidth;
  //   appLoaderWH = tab_appLoaderWH;
  //   backIconSize = tab_backIconSize;
  //   bookHeightDetails = tab_bookHeightDetails;
  //   bookWidthDetails = tab_bookWidthDetails;
  //   fontSizeMedium = tab_font_size_medium;
  //   fontSizeXxxlarge = tab_font_size_xxxlarge;
  //   fontSizeMicro = tab_font_size_micro;
  //   fontSize25 = tab_font_size_25;
  // } else {
  //   log("Device is Mobile");
  //   bookWidth = mobile_bookWidth;
  //   bookViewHeight = mobile_BookViewHeight;
  //   bookHeight = mobile_bookHeight;
  //   backIconSize = mobile_backIconSize;
  //   appLoaderWH = mobile_appLoaderWH;
  //   bookHeightDetails = mobile_bookHeightDetails;
  //   bookWidthDetails = mobile_bookWidthDetails;
  //   fontSizeMedium = mobile_font_size_medium;
  //   fontSizeXxxlarge = mobile_font_size_xxxlarge;
  //   fontSizeMicro = mobile_font_size_micro;
  //   fontSize25 = mobile_font_size_25;
  // }
}




