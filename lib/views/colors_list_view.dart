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
    Color(0xFF7CC6FF),
    Color(0xFF5D8BFF),
    Color(0xFFFFC46B),
    Color(0xFFFF9E43),
    Color(0xFFFF6FA3),
    Color(0xFFE94D8A),
    Color(0xFF9F44FF),
    Color(0xFF49CDBE),
    Color(0xFF65F0E2),
    Color(0xFF7F7BFF),

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
                      currentIndex = index;
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
