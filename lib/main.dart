import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:note_app/add_note_cubit/notes_cubit.dart';
import 'package:note_app/cubit/theme_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/core/simple_bloc_observer.dart';
import 'package:note_app/views/notes_view.dart';

import 'core/app_theme.dart';
import 'core/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(kNotesBox);

  Bloc.observer = SimpleBlocObserver();

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotesCubit()..fetchAllNotes(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: themeMode == ThemeMode.dark
                ? const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: Color(0xff121212),
              systemNavigationBarIconBrightness: Brightness.light,
            )
                : const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Color(0xffF5EBCF),
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,

              themeMode: themeMode,

              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,

              home:  NotesView(),
            ),
          );
        },
      ),
    );
  }
}