import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.lightBlue.shade200,
      elevation: 0,
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.pets_sharp, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.home_outlined, color: Colors.pink),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.menu, color: Colors.pink),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.pin_drop_outlined, color: Colors.pink),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.chat_bubble_outline, color: Colors.pink),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.notifications_outlined, color: Colors.pink),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.person_outline_outlined, color: Colors.pink),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.logout, color: Colors.pink),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
