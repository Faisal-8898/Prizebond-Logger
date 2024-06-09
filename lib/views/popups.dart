import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prizebond_application/globals.dart';
import 'package:prizebond_application/styles/sk.dart';

class SaveController extends GetxController {
  final RxString collectionName = "".obs;
  final RxString singleBond = "".obs;
  final RxString multiBondsFrom = "".obs;
  final RxString multiBondsTo = "".obs;
}

class Popups {
  TextEditingController collectionNameTextField = TextEditingController();
  TextEditingController multiBondsFromTextFieldFrom = TextEditingController();
  TextEditingController multiBondsFromTextFieldTo = TextEditingController();
  TextEditingController singleBondTextField = TextEditingController();

  final VoidCallback onCollectionAdded;

  Popups({required this.onCollectionAdded});

  void addCollectionBtn(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: sk.card(
            content: Padding(
              padding: const EdgeInsets.all(23.0),
              child: Stack(
                children: [
                  sk.card(
                    color: const Color.fromARGB(211, 255, 255, 255),
                    height: 190,
                    width: 400,
                    content: Padding(
                      padding: const EdgeInsets.all(19.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Collection name:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          TextField(
                            controller: collectionNameTextField,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter collection name',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: sk.elevatedButton(
                      content: sk.text(content: "Save"),
                      height: 70,
                      width: 70,
                      elevation: 10,
                      background: const Color.fromARGB(255, 91, 176, 107),
                      foreground: Colors.white,
                      borderColor: const Color.fromARGB(255, 113, 199, 76),
                      borderStyle: BorderStyle.solid,
                      borderWidth: 1.5,
                      onPressed: () {
                        saveBtn(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            color: Colors.transparent,
            shadowColor: Colors.transparent,
            height: 250,
            width: 370,
          ),
        );
      },
    );
  }

  void saveBtn(context) {
    // add list in landing page
    // LandingPage.listOfCollection(collectionNameTextField.text);
    Globals.collectionName = collectionNameTextField.text;
    // LandingPage().of(context).listOfCollection();
    onCollectionAdded();
    Navigator.of(context).pop();
  }

  void saveBtnBonds(context) {
    // add list in landing page
    // LandingPage.listOfCollection(collectionNameTextField.text);
    Globals.singleBondName = singleBondTextField.text;
    // LandingPage().of(context).listOfCollection();
    onCollectionAdded();
    Navigator.of(context).pop();
  }

  void addSingleBondBtn(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: sk.card(
            content: Padding(
              padding: const EdgeInsets.all(23.0),
              child: Stack(
                children: [
                  sk.card(
                    color: const Color.fromARGB(211, 255, 255, 255),
                    height: 190,
                    width: 400,
                    content: Padding(
                      padding: const EdgeInsets.all(19.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Enter Bond Number:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Container(
                            child: TextField(
                              controller:
                                  singleBondTextField, // Replace with your controller for "To:"
                              keyboardType: TextInputType
                                  .number, // Set keyboard type to number
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter
                                    .digitsOnly // Allow only digits
                              ],
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(left: 10.0, top: 4.0),
                                border: OutlineInputBorder(),
                                hintText: 'eg. 0012345',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: sk.elevatedButton(
                      content: sk.text(content: "Save"),
                      height: 70,
                      width: 70,
                      elevation: 10,
                      background: const Color.fromARGB(255, 91, 176, 107),
                      foreground: Colors.white,
                      borderColor: const Color.fromARGB(255, 113, 199, 76),
                      borderStyle: BorderStyle.solid,
                      borderWidth: 1.5,
                      onPressed: () {
                        String singleBondValue = singleBondTextField.text;
                        saveBtnBonds(context);
                        print('Single Bond: $singleBondValue');
                      },
                    ),
                  ),
                ],
              ),
            ),
            color: Colors.transparent,
            shadowColor: Colors.transparent,
            height: 250,
            width: 370,
          ),
        );
      },
    );
  }

  void addMultiBondsBtn(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: sk.card(
            content: Padding(
              padding: const EdgeInsets.all(23.0),
              child: Stack(
                children: [
                  sk.card(
                    color: const Color.fromARGB(211, 255, 255, 255),
                    height: 190,
                    width: 400,
                    content: Padding(
                      padding: const EdgeInsets.all(19.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Enter a Range:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "From:",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                    width: 4.0), // Adjust this value as needed
                                Container(
                                  width: 130, // Adjust this value as needed
                                  height: 30, // Adjust this value as needed
                                  child: TextField(
                                    controller: multiBondsFromTextFieldFrom,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(left: 10.0, top: 4.0),
                                      border: OutlineInputBorder(),
                                      hintText: 'eg. 0012345',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  "To:",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                    width: 10.0), // Adjust this value as needed
                                Container(
                                  width: 130, // Adjust this value as needed
                                  height: 30, // Adjust this value as needed
                                  child: TextField(
                                    controller: multiBondsFromTextFieldTo,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(left: 10.0, top: 4.0),
                                      border: OutlineInputBorder(),
                                      hintText: 'eg. 0012345',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: sk.elevatedButton(
                      content: sk.text(content: "Save"),
                      height: 70,
                      width: 70,
                      elevation: 10,
                      background: const Color.fromARGB(255, 91, 176, 107),
                      foreground: Colors.white,
                      borderColor: const Color.fromARGB(255, 113, 199, 76),
                      borderStyle: BorderStyle.solid,
                      borderWidth: 1.5,
                      onPressed: () {
                        saveBtn(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            color: Colors.transparent,
            shadowColor: Colors.transparent,
            height: 250,
            width: 370,
          ),
        );
      },
    );
  }
}
