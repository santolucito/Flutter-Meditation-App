import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff121421),
        body: InkWell(
          hoverColor: Colors.transparent,
          child: Image.network(
            'https://m.media-amazon.com/images/S/aplus-media/kdp/07a5fba5-4ec8-4786-8f85-c32a896c0dae.__CR0,0,970,600_PT0_SX970_V1___.png',
            width: 70,
            height: 70,
          ),
          onTap: () => amazon(),
        ));
  }
}

amazon() async {
  final Uri _url = Uri.parse(
      'https://www.amazon.com/Math-Mindfulness-Challenging-multiplication-affirmations/dp/B0BB5SY8W3');
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
