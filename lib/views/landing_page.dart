import 'package:flutter/material.dart';
import 'package:prizebond_application/styles/sk.dart';
import 'package:prizebond_application/views/popups.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key, required this.title});
  final String title;

  static _LandingPageState instance = _LandingPageState();
  
  @override
  State<LandingPage> createState() => instance;
}

class _LandingPageState extends State<LandingPage> {
  List<SizedBox> cards = [];

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
        colors: [
          Color.fromARGB(255, 112, 199, 75),
          Color.fromARGB(255, 80, 164, 122),
        ],
        stops: [0, 1],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ),
    );
  }

  Widget mainArea() {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.only(top: 120),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.50),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: ListView(children: cards),
          ),
          Positioned(
            bottom: 35,
            right: 40,
            child: sk.elevatedButton(
              content: const Icon(Icons.add),
              onPressed: () => Popups().addCollectionBtn(context),
              width: 60,
              height: 60,
              elevation: 15,
              foreground: Colors.white,
              background: const Color.fromARGB(255, 112, 199, 75),
              shape: const CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }

  void listOfCollection(String collectionName) {
    setState(() {
      cards.add(
        landingPageCard(
          collectionName: collectionName,
          created: DateTime.now(),
          modified: DateTime.now(),
        ),
      );
    });
  }

  SizedBox landingPageCard({
    int collectionCount = 1,
    required String collectionName,
    required DateTime created,
    required DateTime modified,
  }) {
    int createDay = created.day;
    int createMonth = created.month;
    int createYear = created.year;
    String createdDate = '$createDay-$createMonth-$createYear';

    int modifiedDay = modified.day;
    int modifiedMonth = modified.month;
    int modifiedYear = modified.year;
    String modifiedDate = '$modifiedDay-$modifiedMonth-$modifiedYear';

    return sk.card(
      content: Padding(
        padding: const EdgeInsets.only(
          top: 5.0,
          left: 15,
          right: 15,
          bottom: 4.0,
        ),
        child: landingPageCardStructure(
          collectionCount,
          collectionName,
          createdDate,
          modifiedDate,
        ),
      ),
      height: 80,
      width: 500,
      marginLeft: 15,
      marginTop: 6,
      marginRight: 15,
      elevation: 5,
    );
  }

  Column landingPageCardStructure(
    collectionCount,
    collectionName,
    createdDate,
    modifiedDate,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        sk.text(
          content: 'Collection: $collectionCount',
          fontSize: 12,
          fontFamily: 'Asap',
        ),
        sk.text(
          content: collectionName,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Asap',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            sk.text(content: 'Created: $createdDate', fontSize: 12),
            sk.text(content: 'Modified: $modifiedDate', fontSize: 12),
          ],
        ),
      ],
    );
  }
}
