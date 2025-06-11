import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_scope/features/constant/my_colors.dart';
import 'package:movies_scope/features/home/presentation/screens/home_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  ValueNotifier<int> selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (context, value, _) {
        return Scaffold(
          backgroundColor: MyColors.backgroundColor,
          body: IndexedStack(index: value, children: [HomePage()]),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: MyColors.backgroundColor,
            selectedItemColor: MyColors.activeColor,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: value,
            onTap: (value) {
              selectedIndex.value = value;
            },
            items: [
              BottomNavigationBarItem(
                label: 'home',
                icon: SvgPicture.asset(
                  'assets/images/home.svg',
                  colorFilter: ColorFilter.mode(
                    value == 0 ? const Color(0xff12cdd9) : Colors.grey,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: 'search',
                icon: SvgPicture.asset(
                  'assets/images/search.svg',
                  colorFilter: ColorFilter.mode(
                    value == 1 ? const Color(0xff12cdd9) : Colors.grey,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: 'bookmark',
                icon: SvgPicture.asset(
                  'assets/images/bookmark.svg',
                  colorFilter: ColorFilter.mode(
                    value == 2 ? const Color(0xff12cdd9) : Colors.grey,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
