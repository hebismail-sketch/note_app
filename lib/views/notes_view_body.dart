import 'package:flutter/material.dart';
import 'package:note_app/widget/search_text_field.dart';

import '../custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
        child: Column(
          children: [
            const CustomAppBar(
              title: 'My Notes',
              icon: Icons.star,
            ),

            const SizedBox(height: 24),

            const SearchTextField(),

            const SizedBox(height: 24),

            const Expanded(
              child: NotesListView(),
            ),
          ],
        ),
      ),
    );
  }
}