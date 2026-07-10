
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/models/note_model.dart';

import '../constants.dart' show kNotesBox;


part 'add_note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  Color color = Color(0xffA47574);
  addNote(NoteModel note)async{
    note.color= color!.value;
    emit( NoteLoading());

   try {
     var notesBox=Hive.box(kNotesBox);

       await notesBox.add(note);
     emit( NoteSuccess());
   }  catch (e) {
   emit( NoteFailure(e.toString()));;
   }
  }
}
