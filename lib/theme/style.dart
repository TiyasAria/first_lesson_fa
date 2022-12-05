import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// for color
Color greenColor = Color(0xff039967);
Color greyOld = Color(0xff6A7672);
Color greyNew = Color(0xff89918F);
Color blueOld = Color(0xffEEF7FB);
Color greenSecond = Color(0xff8DA39C);

//  for textstyle
TextStyle titleMain = GoogleFonts.poppins(
  fontSize: 30 , 
  fontWeight: FontWeight.bold,
  color: greyOld
); 

TextStyle subtitleMain = GoogleFonts.poppins(
  fontSize: 20 , 
  fontWeight: FontWeight.w600,
  color: greyNew
); 

TextStyle titleItemMain = GoogleFonts.poppins(
  fontSize: 14 , 
  fontWeight: FontWeight.w600,
); 

TextStyle subtitleItemMain = GoogleFonts.poppins(
  fontSize: 10 , 
  fontWeight: FontWeight.w500,
);

TextStyle detailText  = GoogleFonts.poppins(
  fontSize: 12 , 
  fontWeight: FontWeight.w500,
  color: greyOld
); 

TextStyle titleDetail  = GoogleFonts.poppins(
  fontSize: 20 , 
  fontWeight: FontWeight.w600,
  color: Colors.white
); 

TextStyle locationTextDetail   = GoogleFonts.poppins(
  fontSize: 10 , 
  fontWeight: FontWeight.w500,
  color: Colors.white
); 
