import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/views/add_note_form.dart';

import 'add_note_cubit/note_cubit.dart';

import 'add_note_cubit/notes_cubit.dart';

class AddNoteButtonSheet extends StatefulWidget {
  const AddNoteButtonSheet({super.key});

  @override
  State<AddNoteButtonSheet> createState() => _AddNoteButtonSheetState();
}

class _AddNoteButtonSheetState extends State<AddNoteButtonSheet> {

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),

      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xff1B1B1B)
            : const Color(0xffF5EBCF),

        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),

      child: BlocProvider(
        create: (context) => NoteCubit(),

        child: BlocConsumer<NoteCubit, NoteState>(
          listener: (context, state) {
            if (state is NoteFailure) {
              debugPrint(state.errorMessage);
            }

            if (state is NoteSuccess) {
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();

              Navigator.pop(context);
            }
          },

          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is NoteLoading,

              child: const SingleChildScrollView(
                child: AddNoteForm(),
              ),
            );
          },
        ),
      ),
    );
  }
}