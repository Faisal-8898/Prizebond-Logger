import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key, required this.title});
  final String title;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return Container(
      decoration: bodyBackground(),
      child: mainArea(),
    );
  }

  BoxDecoration bodyBackground() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xff70c74b), Color(0xff50a47a)],
        stops: [0, 1],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ),
    );
  }

  Container mainArea() {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.only(top: 120),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.50),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: rowOfCards(),
      ),
    );
  }

  Column rowOfCards() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        card(created: DateTime.now(), modified: DateTime.now()),
        card(created: DateTime.now(), modified: DateTime.now()),
        card(created: DateTime.now(), modified: DateTime.now()),
        card(created: DateTime.now(), modified: DateTime.now()),
      ],
    );
  }

  SizedBox card({int collentionCount = 1, String collectionName = "Name", required DateTime created, required DateTime modified}) {
    return const SizedBox(
      height: 80,
      width: 500,
      child: Card(
        margin: EdgeInsets.only(left: 15, right: 15, top: 6),
        elevation: 5,
        color: Colors.white,
      ),
    );
  }
}
