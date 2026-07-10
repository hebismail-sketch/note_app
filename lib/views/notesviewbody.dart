
 
import 'package:flutter/material.dart';

import '../customappber.dart';
import 'notes_listview.dart';


class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding
    (padding:EdgeInsets.symmetric(horizontal:24),child:
     Column
     (children:[SizedBox(height:50),
     CustomAppBar(title: 'NOTES',
     icon:Icons.search),
     Expanded(child:
     NotesListView(),)]),);
  }
}
