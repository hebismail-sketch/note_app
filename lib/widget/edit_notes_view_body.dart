import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/add_note_cubit/notes_cubit.dart';
import 'package:note_app/widget/custom_text_field.dart';
import 'package:note_app/custom_app_bar.dart';
import 'package:note_app/models/note_model.dart';
import 'dart:io';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);

    cotentController = TextEditingController(text: widget.note.subTitle);
  }

  String? title;
  String? content;
  late TextEditingController titleController;
  late TextEditingController cotentController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF3E4B5),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_rounded, size: 28),
                  ),

                  TextButton(
                    onPressed: () {
                      widget.note.title = title ?? widget.note.title;
                      widget.note.subTitle = content ?? widget.note.subTitle;

                      widget.note.save();

                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();

                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Expanded(
                child: Column(
                  children: [
                    if (widget.note.imagePath != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(widget.note.imagePath!),
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (widget.note.imagePath != null)
                      const SizedBox(height: 20),

                    CustomTextField(
                      controller: titleController,
                      fontSize: 44,
                      hint: '',
                      maxLines: 2,
                      onChanged: (value) {
                        title = value;
                      },
                    ),

                    const SizedBox(height: 24),

                    Expanded(
                      child: SingleChildScrollView(
                        child: CustomTextField(
                          fontSize: 30,
                          controller:  cotentController,
                          hint:'',
                          maxLines: 10,
                          onChanged: (value) {
                            content = value;
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
