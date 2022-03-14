import 'package:flutter/material.dart';
import 'package:getx_starter/core/constants/colors.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      //bottom navigation bar on scaffold
      color: primaryColor,
      shape: const CircularNotchedRectangle(), //shape of notch
      
      notchMargin: 8,
       //notche margin between floating button and bottom appbar
      child: Row(
        //children inside bottom appbar
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(height: 50,)
          // Padding(
          //   padding: EdgeInsets.only(left: 90),
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.menu,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {},
          //   ),
          // ),
          // IconButton(
          //   icon: Icon(
          //     Icons.search,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {},
          // ),
          // IconButton(
          //   icon: Icon(
          //     Icons.print,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {},
          // ),
          // IconButton(
          //   icon: Icon(
          //     Icons.people,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {},
          // ),
        ],
      ),
    );
  }
}
