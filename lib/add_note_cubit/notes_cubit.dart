import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/core/constants.dart';

import '../models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  List<NoteModel>? allNotes;

  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    allNotes = notesBox.values.toList();

    notes = List.from(allNotes!);
    emit(NotesSuccess());
  }

  void searchNotes(String query) {
    if (query.isEmpty) {
      notes = List.from(allNotes!);
    }else{notes=allNotes!.where((note){

      return note.title.toLowerCase().contains(query.toLowerCase())||

          note.subTitle.toLowerCase().contains(query.toLowerCase());
    }).toList();}emit(NotesSuccess());
  }
}
