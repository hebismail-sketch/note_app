import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/theme_cubit.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        bool isLight = themeMode == ThemeMode.light;

        return GestureDetector(
          onTap: () {
            context.read<ThemeCubit>().toggleTheme(!isLight);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: 76,
            height: 38,
            decoration: BoxDecoration(
              color: isLight
                  ? const Color(0xffE2CEA3)
                  : const Color(0xff2A2A2A),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.light_mode_rounded,
                        color: isLight
                            ? Colors.orange
                            : Colors.grey.shade500,
                        size: 18,
                      ),
                      Icon(
                        Icons.dark_mode_rounded,
                        color: isLight
                            ? Colors.grey.shade600
                            : Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),

                AnimatedAlign(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  alignment: isLight
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.15),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}