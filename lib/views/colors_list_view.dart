import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/add_note_cubit/note_cubit.dart';
import 'package:note_app/widget/color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({
    super.key,
  });

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  List<Color> colors = const [
    Color(0xffD8684C),
    Color(0xffCE6A53),
    Color(0xffC34934),
    Color(0xffA47574),
    Color(0xff9F7678),
    Color(0xffC24C68),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: GestureDetector(
                    onTap: () {
                      currentIndex == index;
                      BlocProvider.of
                      <NoteCubit>(context).color = colors[index];
                      setState(() {});
                    },
                    child: ColorItem(
                      color: colors[index],
                      isActive: currentIndex == index,
                    )));
          }),
    );
  }
}
