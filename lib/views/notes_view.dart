import 'package:flutter/material.dart';


import '../add_note_bottonsheet.dart';
import 'notesviewbody.dart';

class NotesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(isScrollControlled: true,
                context: context,
                builder: (context) => AddNoteButtonSheet());
          },
          child: Icon(Icons.add)),
      body: const NotesViewBody(),
    );
  }
}
