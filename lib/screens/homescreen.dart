import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sql_netcore/screens/app_search.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURLMinerd() async {
  var url = Uri.parse("https://documentos.educacion.do/portal/home.newppd");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw "cant connect to $url";
  }
}

_launchURLMescyt() async {
  var url = Uri.parse("https://mescyt.gob.do");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw "cant connect to $url";
  }
}

_launchURLInfotep() async {
  var url = Uri.parse("https://www.infotep.gob.do");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw "cant connect to $url";
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppSearch(),
            Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
                Center(
                  child: CircularPercentIndicator(
                    animation: true,
                    animationDuration: 1000,
                    radius: 100,
                    lineWidth: 20,
                    percent: 0.0,
                    progressColor: Colors.blue,
                    backgroundColor: Colors.blueGrey.shade200,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: const Text('0%'),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 100,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Ink.image(
                              image: const AssetImage('images/Logo.png'),
                              width: 100,
                              height: 100,
                            ),
                            const Center(
                              child: ElevatedButton(
                                onPressed: _launchURLMinerd,
                                child: Text(
                                  'Solicitar',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(40),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Ink.image(
                              image: const AssetImage('images/mescyt.png'),
                              width: 100,
                              height: 100,
                            ),
                            const Center(
                              child: ElevatedButton(
                                  onPressed: _launchURLMescyt,
                                  child: Text(
                                    'Solicitar',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: const AssetImage('images/logo-infotep.png'),
                            width: 100,
                            height: 100,
                          ),
                          const Center(
                            child: ElevatedButton(
                                onPressed: _launchURLInfotep,
                                child: Text(
                                  'Solicitar',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'PORTAL UNICO DE EDUCACION',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        width: 200,
        backgroundColor: Colors.white,
        child:
            // ignore: prefer_const_literals_to_create_immutables
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const DrawerHeader(
              child: Icon(
            Icons.person_outlined,
            size: 50,
          )),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'M E N U',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.message),
            title: Text(
              'M E S S A G E',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.history),
            title: Text('H I S T O R Y', style: TextStyle(color: Colors.blue)),
          ),
          const ListTile(
            leading: Icon(Icons.link),
            title: Text('L O G O U T', style: TextStyle(color: Colors.blue)),
          ),
        ]),
      ),
    );
  }
}
