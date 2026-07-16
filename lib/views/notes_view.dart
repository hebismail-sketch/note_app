import 'package:flutter/material.dart';

import '../add_note_bottonsheet.dart';
import 'notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 6,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return const AddNoteButtonSheet();
            },
          );
        },
        child: const Icon(
          Icons.add_rounded,
          size: 30,
        ),
      ),

      body: const NotesViewBody(),
    );
  }
}