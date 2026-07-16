import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widget/note_item.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../add_note_cubit/notes_cubit.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: MasonryGridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            itemCount: notes.length,

            itemBuilder: (context, index) {
              return NoteItem(note: notes[index]);
            },
          ),
        );
      },
    );
  }
}
