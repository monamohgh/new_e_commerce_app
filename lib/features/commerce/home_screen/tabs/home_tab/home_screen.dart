import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/core/utils/app_assets.dart';
import 'package:new_e_commerce_app/core/utils/app_colors.dart';
import 'package:new_e_commerce_app/features/commerce/home_screen/tabs/category_tab/category_tab.dart';
import 'package:new_e_commerce_app/features/commerce/home_screen/tabs/fav_tab/fav_tab.dart';
import 'package:new_e_commerce_app/features/commerce/home_screen/tabs/home_tab/home_tab.dart';
import 'package:new_e_commerce_app/features/commerce/home_screen/tabs/profile_tab/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
List<Widget>tabsList=[
HomeTab(),CategoryTab(),FavTab(),ProfileTab(),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primaryColor,
        currentIndex: selectedIndex,
          onTap:  (index) {
       selectedIndex=index;
       setState(() {

       });
          },
        items: [
          _builtBottomNavBarItem(
            selectedIcon: Image(image: AssetImage(AppAssets.homeSelectedIcon)),
            unSelectedIcon:Image(image: AssetImage(AppAssets.homeUnSelectedIcon)),
            isSelected: selectedIndex == 0,
              label: ''

          ),
          _builtBottomNavBarItem(
              selectedIcon: Image(image: AssetImage(AppAssets.categorySelectedIcon)),
              unSelectedIcon:Image(image: AssetImage(AppAssets.categoryUnSelectedIcon)),
              isSelected: selectedIndex == 1,
              label: ''

          ),
          _builtBottomNavBarItem(
              selectedIcon: Image(image: AssetImage(AppAssets.favSelectedIcon)),
              unSelectedIcon:Image(image: AssetImage(AppAssets.favUnSelectedIcon)),
            isSelected: selectedIndex == 2,
              label: ''

          ),
          _builtBottomNavBarItem(
              selectedIcon: Image(image: AssetImage(AppAssets.profileSelectedIcon)),
              unSelectedIcon:Image(image: AssetImage(AppAssets.profileUnSelectedIcon)),
            isSelected: selectedIndex == 3,
            label: ''
          ),
        ],

      ),
      body: tabsList[selectedIndex],

    );
  }
}
BottomNavigationBarItem _builtBottomNavBarItem({
  required Widget selectedIcon,
  required Widget unSelectedIcon,
  required bool isSelected,
  required String label
}) {
  return BottomNavigationBarItem(
    icon: isSelected?Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.whiteColor
        ),
        padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 8.h
        ),
        child: selectedIcon):unSelectedIcon,
    label: label,

  );
}
