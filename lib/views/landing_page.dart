import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prizebond_application/globals.dart';
import 'package:prizebond_application/styles/sk.dart';
import 'package:prizebond_application/views/popups.dart';
import 'package:prizebond_application/views/bondsList.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key, required this.title});
  final String title;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Widget> cards = [];

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
            child: ListView(key: ValueKey(cards.length), children: cards),
          ),
          Positioned(
            bottom: 35,
            right: 40,
            child: sk.elevatedButton(
              content: const Icon(Icons.add),
              onPressed: () => Popups(onCollectionAdded: listOfCollection)
                  .addCollectionBtn(context),
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

  void listOfCollection() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setState(() {
        cards.add(landingPageCard(
          collectionCount: cards.length + 1,
          collectionName: Globals.collectionName,
          created: DateTime.now(),
          modified: DateTime.now(),
        ));
      }),
    );
  }

  landingPageCard({
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
    return GestureDetector(
      onTap: () {
        print("tapped");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BondsList(),
          ),
        );
      },
      child: sk.card(
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
      ),
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
