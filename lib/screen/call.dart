import 'package:akhir/home/card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HubKami extends StatefulWidget {
  @override
  State<HubKami> createState() => _HubKamiState();
}

class _HubKamiState extends State<HubKami> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue.shade800,
            Color(0xffA0DA3F),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 40,
              color: Colors.transparent,
              child: Center(
                child: Text(
                  "Hubungi kami",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 25,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Hubungi kami",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF3D538F),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.phone,
                            color: Color(0xFF3D538F),
                            size: 30,
                          ),
                          onPressed: () {
                            _launchURL("+6287894180578");
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 25,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Lokasi Kami",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF3D538F),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.location_on,
                            color: Color(0xFF3D538F),
                            size: 30,
                          ),
                          onPressed: () {
                            _launchURL(
                                "https://www.google.co.id/maps/place/Politeknik+Gajah+Tunggal/@-6.1930236,106.5668906,17z/data=!3m1!4b1!4m5!3m4!1s0x2e69fe4fc675da0f:0x84a0e5fc6c009127!8m2!3d-6.1930289!4d106.5690793");
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Image(
            height: 50,
            image: AssetImage(
              "icon/back-arrow.png",
            )),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
        },
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
