import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/add_note_cubit/note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/colors_list_view.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../widget/custom_text_field.dart';
import 'custom_button.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title;
  String? subTitle;
  File? selectedImage;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source:
    ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New Note",
            style: Theme
                .of(context)
                .textTheme
                .titleLarge
                ?.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 28),

          CustomTextField(
            fontSize: 34,
            hint: "Title",
            maxLines: 1,
            onSaved: (value) {
              title = value;
            },
          ),

          const SizedBox(height: 22),

          CustomTextField(
            fontSize: 22,
            hint: "Start writing...",
            maxLines: 9,
            onSaved: (value) {
              subTitle = value;
            },
          ),

          const SizedBox(height: 28),
          GestureDetector(onTap: pickImage,
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12)
                ,


              ),
              child: selectedImage == null ? const Column(
                mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.add_a_photo_outlined, size: 40,),
                SizedBox(height: 8,),Text('Add Image')


              ],
              ):ClipRRect(borderRadius: BorderRadius.circular(12),child: 
                Image.file(selectedImage!,fit: BoxFit.cover,),)


            ),


          ),SizedBox(height: 20,),

          const ColorsListView(),

          const SizedBox(height: 32),

          BlocBuilder<NoteCubit, NoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is NoteLoading,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    final note = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: DateFormat.yMd().format(DateTime.now()),
                      color: Colors.blue.value,
                      imagePath: selectedImage?.path,
                    );

                    context.read<NoteCubit>().addNote(note);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              );
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
