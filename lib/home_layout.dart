import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tast_abdelhamid/core/theming/app_colors.dart';
import 'package:flutter_tast_abdelhamid/features/home/ui/home_screen.dart';
import 'features/home/logic/cubit.dart';
import 'features/home/ui/widget/buildNavItem.dart';
import 'features/packages_screen/ui/packages_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('محادثة')));
}

class AddAdScreen extends StatelessWidget {
  const AddAdScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('أضف أعلان')));
}

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('إعلاناتي')));
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('حسابي')));
}

class AppLayout extends StatelessWidget {
  AppLayout({super.key});

  final List<Widget> screens = const [
    ProfileScreen(),
    MyAdsScreen(),
    PackagesScreen(),
    ChatScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          body: screens[selectedIndex],
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            height: 66.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavItem(
                  context,
                  selectedIndex,
                  svgPath: 'assets/icons/bungalow.svg',
                  label: 'الرئيسية',
                  index: 4,
                ),
                buildNavItem(
                  context,
                  selectedIndex,
                  svgPath: 'assets/icons/chat.svg',
                  label: 'محادثة',
                  index: 3,
                ),
                buildNavItem(
                  context,
                  selectedIndex,
                  svgPath: 'assets/icons/add_box.svg',
                  label: 'أضف أعلان',
                  index: 2,
                ),
                buildNavItem(
                  context,
                  selectedIndex,
                  svgPath: 'assets/icons/dataset.svg',
                  label: 'إعلاناتي',
                  index: 1,
                ),
                buildNavItem(
                  context,
                  selectedIndex,
                  svgPath: 'assets/icons/account_circle.svg',
                  label: 'حسابي',
                  index: 0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
