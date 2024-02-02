import 'package:flutter/material.dart';
Widget defaultText({
 required String text,
  required double fontsize,
  bool isUpperCase = false,
  Color colortext =Colors.black45,
  FontWeight fontweighttext=FontWeight.bold,
    })=>Text(
  isUpperCase ? text.toUpperCase(): text,
  maxLines: 3,
  overflow: TextOverflow.ellipsis,
  style: TextStyle(
      color: colortext,
      fontWeight: fontweighttext,
      fontFamily:"fonttry",
      fontSize: fontsize
  ),
);

Widget defaultTextsec({
  required String text,
  Color colortext =const Color(0xFF00796B),
  FontWeight fontweighttext=FontWeight.bold,
})=>Text(
  text,
  style: TextStyle(
     color: colortext,
     fontFamily:"fonttrysec",
     fontSize: 20,
      fontWeight: fontweighttext,
 ),
 );


Widget defaultTextthird({
  required String text,
  Color colortext =Colors.black,
  required double fontsize,
  FontWeight fontweighttext=FontWeight.w400,
})=>Text(
  text,
  style: TextStyle(
    height: 1.25,
    color: colortext,
    fontSize: fontsize,
   fontWeight: fontweighttext,
  ),
);

Widget DefaultFloatingButton({
  required IconData icons,
})=>Transform.scale(
  scale: 0.75,
  child: FloatingActionButton(
    elevation: 0.0,
    shape:CircleBorder(
      side: BorderSide(
        width: 1.5,
        color: Colors.black,
      ),
    ),
    backgroundColor: Colors.white,
    onPressed: () {},
    child: Icon(
      icons,
      color: Colors.black,
      size: 35,
    ),
  ),
);

Widget DefaultFloatingButtonsec({
  required IconData icons,
})=>Transform.scale(
  scale: 0.75,
  child: FloatingActionButton(
    elevation: 0.0,
    backgroundColor: Colors.black,
    onPressed: () {},
    child: Icon(
      icons,
    ),
  ),
);
//Icons.notes