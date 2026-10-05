import 'package:flutter/material.dart';
import 'package:flutter_application_for_learning/components/sidebar.dart';
import 'package:flutter_application_for_learning/components/topbar.dart';

class ListScreenTablet extends StatefulWidget {
  const ListScreenTablet({super.key});

  @override
  State<ListScreenTablet> createState() => _ListScreenTablet();
}

class _ListScreenTablet extends State<ListScreenTablet> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: TopBarCustom(title: "List Screen"),
      body: Row(
        children: [
          SidebarCustom(),
          Expanded(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  // for search filters
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            // onChanged: (value) => _filterSearchResults(value), // 👈 Triggers search query on every keystroke
                            decoration: InputDecoration(
                              labelText: 'Search Records',
                              hintText: 'Type item name...',
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.blueGrey,
                              ),
                              // Add a modern capsule/pill boundary border shape configuration
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: const BorderSide(
                                  color: Colors.blueGrey,
                                  width: 2.0,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                  // the list
                  Expanded(
                    child: ListView.builder(
                      itemCount: 25,
                      padding: EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(child: Text('${index + 1}')),
                          title: Text('Record Entry No. $index'),
                          subtitle: Text('Some subtitle infor'),
                          tileColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          trailing: Icon(Icons.arrow_forward, size: 16),
                          onTap: () {
                            debugPrint("Tapped Index No: $index");
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
