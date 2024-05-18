import 'package:flutter/material.dart';
import 'package:prizebond_application/styles/sk.dart';
import 'package:prizebond_application/views/landingPage.dart';

class Popups {
  TextEditingController collectionNameTextField = TextEditingController();

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
                      padding: EdgeInsets.all(19.0),
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
                      onPressed: doneBtn,
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

  void doneBtn() {
    LandingPage.instance.listOfCollection(collectionNameTextField.text);
  }
}
