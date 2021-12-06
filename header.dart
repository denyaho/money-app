import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget{
  @override
  Size get preferredSize => Size.fromHeight(40.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      leading: Padding(
          padding: EdgeInsets.all(5.0),
          child: Icon(
              Icons.settings,
              color: Colors.black)
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Text('custom',
              style: TextStyle(
                  color: Colors.black
              )),
        )
      ],
      title: Text('Home',
          style: TextStyle(
              color: Colors.black
          )),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 2.0,
    );
  }
}