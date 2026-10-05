import 'package:flutter/material.dart';

class CRUDSample extends StatefulWidget {
  const new({super.key});

  @override
  State<CRUDSample> createState() => _CRUDSampleState();
}

class _CRUDSampleState extends State<CRUDSample> {
  var textControllerName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          // the input part
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: textControllerName,
                  decoration: InputDecoration(
                    hintText: "Enter Name here...",
                    // when not focused
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                    // when focused
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
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
                  // code here
                },
                child: Text("Submit"),
              ),
            ],
          ),

          SizedBox(width: 12),
          // the list part
          Expanded(child: widget),
        ],
      ),
    );
  }
}
