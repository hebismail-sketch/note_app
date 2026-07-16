import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/views/edit_note_view.dart';
import 'dart:io';
import '../add_note_cubit/notes_cubit.dart';
import '../models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(note: note);
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 5),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(note.color),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 15,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (note.imagePath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(File(note.imagePath!), height: 150,
                  width: double.infinity,
                  fit
                  :BoxFit.cover,),
              ),if(note.imagePath!=null)const SizedBox(height: 12,),




            Align(
              alignment: Alignment.centerLeft,

              child: Text(
                note.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(note.subTitle, maxLines: 8, overflow: TextOverflow.ellipsis),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  },
                  icon: Icon(
                    Icons.delete_outlined,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  note.date,
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
