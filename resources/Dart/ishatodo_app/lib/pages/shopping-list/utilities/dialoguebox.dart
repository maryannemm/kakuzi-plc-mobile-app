// dialoguebox.dart
import 'package:flutter/material.dart';
import 'package:ishatodo_app/pages/shopping-list/utilities/button.dart';

class DialogueBox extends StatelessWidget {
  final TextEditingController mycontroller;
  final TextEditingController price;
  final VoidCallback onsave;
  final VoidCallback oncancel;

  const DialogueBox({
    super.key,
    required this.mycontroller,
    required this.price,
    required this.onsave,
    required this.oncancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 200,
        width: 300, // Adjust the width as needed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Shopping item name'),
              controller: mycontroller,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 100,
              child: TextField(
                decoration: const InputDecoration(hintText: 'Price'),
                controller: price,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MyButton(text: 'Add', onPressed: onsave),
                MyButton(text: 'Cancel', onPressed: oncancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
