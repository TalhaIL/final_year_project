import 'package:flutter/material.dart';
import 'package:playbeat/Controllers/auth_controller.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 154,
            width: double.infinity,
            color: Colors.deepPurple,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  iconWithText(
                      icon: Icons.music_note,
                      iconSize: 35,
                      text: 'Play the Beat',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 15,
                  ),
                  iconWithText(
                    icon: Icons.person,
                    iconSize: 22,
                    text: 'Muhammad Talha Ilyas',
                    fontSize: 16,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Column(
              children: [
                drawerItem(
                  icon: Icons.privacy_tip_outlined,
                  text: 'Privacy Policy',
                  onPress: () {},
                ),
                drawerItem(
                    icon: Icons.info_outline, text: 'About', onPress: () {}),
                drawerItem(
                    icon: Icons.logout,
                    text: 'Logout',
                    onPress: () {
                      AuthController.instance.logout();
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row iconWithText({
    required IconData icon,
    double? iconSize,
    required String text,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: iconSize,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        )
      ],
    );
  }

  Column drawerItem(
      {required String text,
      required IconData icon,
      required void Function()? onPress}) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: onPress,
          child: Row(
            children: [
              Icon(
                icon,
                size: 25,
              ),
              const SizedBox(width: 20),
              Text(
                text,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          thickness: 1.5,
        ),
      ],
    );
  }
}
