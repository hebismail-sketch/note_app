import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/views/add_note_form.dart';

import 'add_note_cubit/note_cubit.dart';
import 'add_note_cubit/notes_cubit.dart';

class AddNoteButtonSheet extends StatefulWidget {
  const AddNoteButtonSheet({Key? key}) : super(key: key);

  @override
  State<AddNoteButtonSheet> createState() => _AddNoteButtonSheetState();
}

class _AddNoteButtonSheetState extends State<AddNoteButtonSheet> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: BlocProvider(
        create: (context) => NoteCubit(),
        child: BlocConsumer<NoteCubit, NoteState>(
          listener: (context, state) {
            if (state is NoteFailure) {
              print('failed ${state.errorMessage}');
            }
            if (state is NoteSuccess) {
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            print('ui rebuild');
            return AbsorbPointer(
              absorbing: state is NoteLoading ? true : false,
              child: Padding(
                padding:  EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SingleChildScrollView(child: AddNoteForm()),
              ),
            );
          },
        ),
      ),
    );
  }
}
