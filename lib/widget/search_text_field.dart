import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/add_note_cubit/notes_cubit.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      onChanged: (value) {
        BlocProvider.of<NotesCubit>(context).searchNotes(value);
      },

      style: TextStyle(
        color: Theme.of(context).textTheme.bodyLarge?.color,
        fontSize: 17,
      ),

      cursorColor: Theme.of(context).colorScheme.primary,

      decoration: InputDecoration(
        hintText: 'Search notes',

        hintStyle: TextStyle(
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),

        prefixIcon: Icon(
          Icons.search_rounded,
          color: Theme.of(context).iconTheme.color,
        ),

        filled: true,

        fillColor: isDark
            ? const Color(0xff1F1F1F)
            : Colors.white.withOpacity(.55),

        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 20,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}