import 'package:flutter/material.dart';

class MusicContainer extends StatelessWidget {
  final String categoryName;
  final String imageUrl;
  const MusicContainer({
    Key? key,
    required this.categoryName,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.black,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(imageUrl),
              ),
            ),
            Positioned(
              top: 15,
              left: 15,
              child: Container(
                height: 30,
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  categoryName,
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
