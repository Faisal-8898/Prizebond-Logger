import 'package:flutter/material.dart';
import 'package:prizebond_application/globals.dart';
import 'package:prizebond_application/styles/sk.dart';
import 'package:prizebond_application/views/popups.dart';

class BondsList extends StatefulWidget {
  const BondsList({super.key});

  @override
  State<BondsList> createState() => _BondsListState();
}

class _BondsListState extends State<BondsList> {
  List<Widget> bondCards = [];

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
      child: foo(),
    );
  }

  Widget foo() {
    return Column(
      children: [
        Row(
          children: [fooButoon(), fooButton2()],
        )
      ],
    );
  }

  Widget fooButoon() {
    return sk.elevatedButton(
      content: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add),
          SizedBox(width: 5), // Adjust this value as needed
          Text('Single bond'),
        ],
      ),
      onPressed: () => Popups(onCollectionAdded: listOfBondsCollection)
          .addSingleBondBtn(context),
      width: 160,
      height: 40,
      elevation: 15,
      foreground: Colors.white,
      background: const Color.fromARGB(255, 112, 199, 75),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }

  Widget fooButton2() {
    return sk.elevatedButton(
      content: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add),
          SizedBox(width: 5), // Adjust this value as needed
          Text('Multiple bonds'),
        ],
      ),
      onPressed: () => Popups(onCollectionAdded: listOfBondsCollection)
          .addMultiBondsBtn(context),
      width: 160,
      height: 40,
      elevation: 15,
      foreground: Colors.white,
      background: const Color.fromARGB(255, 112, 199, 75),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }

  void listOfBondsCollection() {
    setState(() {
      bondCards.add(bondCardPage(
        bondNumber: bondCards.length + 1,
        bondName: Globals.singleBondName,
      ));
    });
  }

  Widget bondCardPage({
    int bondNumber = 1,
    required String bondName,
  }) {
    return sk.card(
      content: Padding(
        padding: const EdgeInsets.only(
          top: 5.0,
          left: 15,
          right: 15,
          bottom: 4.0,
        ),
        child: landingPageCardStructure(bondNumber),
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
    bondNumber,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        sk.text(
          content: '$bondNumber',
          fontSize: 12,
          fontFamily: 'Asap',
        ),
      ],
    );
  }
}
