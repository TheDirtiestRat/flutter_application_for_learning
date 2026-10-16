import 'package:flutter/material.dart';
import 'package:flutter_application_for_learning/components/topbar.dart';

// 1. A simple Note model (since we removed the NoteProvider file)
class Note {
  String id;
  String name;
  String content;

  Note({required this.id, required this.name, required this.content});
}

class CRUDSample extends StatefulWidget {
  const CRUDSample({super.key});

  @override
  State<CRUDSample> createState() => _CRUDSampleState();
}

class _CRUDSampleState extends State<CRUDSample> {
  // 2. Local State List to hold our notes instead of a Provider
  List<Note> notes = [];

  final TextEditingController searchController = TextEditingController();
  final TextEditingController textControllerName = TextEditingController();
  final TextEditingController textControllerContent = TextEditingController();

  String searchQuery = '';

  @override
  void dispose() {
    searchController.dispose();
    textControllerName.dispose();
    textControllerContent.dispose();
    super.dispose();
  }

  void _showNoteDialog(BuildContext context, {String? noteId}) {
    // Check if we are editing an existing note
    if (noteId != null) {
      final existingNote = notes.firstWhere((note) => note.id == noteId);
      textControllerName.text = existingNote.name;
      textControllerContent.text = existingNote.content;
    } else {
      textControllerName.clear();
      textControllerContent.clear();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        insetPadding: const EdgeInsets.all(16),
        title: Text(noteId == null ? "Add New Note" : "Edit Note"),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: textControllerName,
                decoration: InputDecoration(
                  hintText: "Enter Name here...",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: textControllerContent,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Enter Content here...",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
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
              if (textControllerName.text.trim().isNotEmpty) {
                // 3. Use setState to update the local list
                setState(() {
                  if (noteId == null) {
                    // CREATE
                    notes.add(
                      Note(
                        id: DateTime.now()
                            .toString(), // Generate a unique ID based on time
                        name: textControllerName.text.trim(),
                        content: textControllerContent.text,
                      ),
                    );
                  } else {
                    // UPDATE
                    final index = notes.indexWhere((n) => n.id == noteId);
                    if (index != -1) {
                      notes[index].name = textControllerName.text.trim();
                      notes[index].content = textControllerContent.text;
                    }
                  }
                });

                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filter notes based on the search query
    final filteredNotes = notes.where((note) {
      final titleLower = note.name.toLowerCase();
      final contentLower = note.content.toLowerCase();
      final searchLower = searchQuery.toLowerCase();

      return titleLower.contains(searchLower) ||
          contentLower.contains(searchLower);
    }).toList();

    return Scaffold(
      appBar: TopBarCustom(title: "CRUD Sample"),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        onPressed: () => _showNoteDialog(context),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search Note here...",
                prefixIcon: const Icon(Icons.search, color: Colors.blueGrey),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {
                          searchController.clear();
                          setState(() => searchQuery = '');
                        },
                      )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.blueGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.blueGrey),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // 4. Removed Consumer, directly using our local list
            Expanded(
              child: notes.isEmpty
                  ? const Center(child: Text("No Notes yet. Add one!"))
                  : filteredNotes.isEmpty
                  ? const Center(child: Text("No matching notes found."))
                  : ListView.builder(
                      itemCount: filteredNotes.length,
                      itemBuilder: (context, index) {
                        final note = filteredNotes[index];

                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: ListTile(
                            title: Text(note.name),
                            subtitle: Text(
                              note.content,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () =>
                                      _showNoteDialog(context, noteId: note.id),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    // 5. Delete using setState
                                    setState(() {
                                      notes.removeWhere((n) => n.id == note.id);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
