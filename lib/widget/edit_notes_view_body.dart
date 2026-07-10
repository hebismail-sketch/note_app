import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/add_note_cubit/notes_cubit.dart';
import 'package:note_app/custom_tixt_field.dart';
import 'package:note_app/customappber.dart';
import 'package:note_app/models/note_model.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key,required this.note});
final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title,content;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [SizedBox(height: 50,),

          CustomAppBar(onPressed: (){
            widget.note.title = title ?? widget.note.title;
            widget.note.subTitle = content ?? widget. note.subTitle;
            widget.note.save();
            BlocProvider.of<NotesCubit>(context). fetchAllNotes();
            Navigator.pop(context);
          },
            title: 'Edit Note',
          icon: Icons.check,),
          SizedBox(height: 50,) ,
        CustomTextField(onChanged: (value){title=value;},
          hint:widget.note.title,maxLines: 2,),
          SizedBox(height: 50,),
          CustomTextField(onChanged: (value){content=value;},
            hint:widget.note.subTitle, maxLines: 5,)
        ],
      ),
    );
  }
}
