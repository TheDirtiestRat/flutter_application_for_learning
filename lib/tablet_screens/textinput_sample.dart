import 'package:flutter/material.dart';
import 'package:flutter_application_for_learning/components/topbar.dart';

class TextinputSample extends StatefulWidget {
  const new({super.key});

  @override
  State<TextinputSample> createState() => _TextinputSampleState();
}

class _TextinputSampleState extends State<TextinputSample> {
  var textControllerSample = TextEditingController();

  String output_text = "";

  void updateOutputText() {
    setState(() {
      output_text = textControllerSample.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarCustom(title: "Text Input Sample"),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textControllerSample,
                    decoration: InputDecoration(
                      hintText: "Enter Text...",
                      // when not focused
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      // when focused
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    updateOutputText();
                  },
                  child: Text("Get Text"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      output_text,
                      style: TextStyle(
                        color: Colors.white, // Changes the text color
                        fontSize: 24.0, // Size of the text
                        letterSpacing: 1.5, // Adds space between characters
                        wordSpacing: 2.0, // Adds space between words
                        // decoration: TextDecoration
                        //     .underline, // Underlines the text (or lineThrough)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
