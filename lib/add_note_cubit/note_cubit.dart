import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/models/note_model.dart';

import '../core/constants.dart' show kNotesBox;

part 'add_note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  Color color = Color(0xffA47574);

  addNote(NoteModel note) async {
    print("1");

    note.color = color.value;

    emit(NoteLoading());

    try {
      print("2");

      var notesBox = Hive.box<NoteModel>(kNotesBox);

      print("3");

      await notesBox.add(note);

      print("4");

      emit(NoteSuccess());
    } catch (e) {
      print(e);
      emit(NoteFailure(e.toString()));
    }
  }
}
