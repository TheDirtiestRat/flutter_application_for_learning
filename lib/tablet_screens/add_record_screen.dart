import 'package:flutter/material.dart';
import 'package:flutter_application_for_learning/components/topbar.dart';

class AddRecordScreenTablet extends StatefulWidget {
  const AddRecordScreenTablet({super.key});

  @override
  State<AddRecordScreenTablet> createState() => _AddRecordScreenTablet();
}

class _AddRecordScreenTablet extends State<AddRecordScreenTablet> {
  final _formkey = GlobalKey<FormState>();

  // String _title = '';
  // String _description = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: TopBarCustom(title: "Add Record"),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter Title here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  prefixIcon: Icon(Icons.title),
                  
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Empty, please Enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  // _title = value ?? "";
                },
              ),

              SizedBox(height: 16,),

              TextFormField(
                // minLines: 3,
                maxLines: 8,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter Description here...',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  // prefixIcon: Padding(padding: EdgeInsets.only(bottom: 100), child: Icon(Icons.description),),
                ),
                validator: (value) {
                  if (value == null || value.length > 300) {
                    return 'The Description must be under 300 characters';
                  }
                  return null;
                },
                onSaved: (value) {
                  // _description = value ?? "";
                },
              ),

              const Spacer(),
              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    )
                  ),
                  onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    debugPrint("Ready to Insert Record!!");

                    // ready to insert in a database...
                  }
                }, child: Text("Add Record")),
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
