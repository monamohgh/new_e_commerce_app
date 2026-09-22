import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_e_commerce_app/core/utils/app_assets.dart';
import 'package:new_e_commerce_app/core/utils/app_colors.dart';
import 'package:new_e_commerce_app/core/utils/app_styles.dart';
import 'package:new_e_commerce_app/features/common/widgets/custom_text_form_field.dart';

class HomeTab extends StatelessWidget {
   HomeTab({super.key});
List<Image>addImages=[
  Image(image: AssetImage(AppAssets.ad1Image)),
  Image(image: AssetImage(AppAssets.ad2Image)),
  Image(image: AssetImage(AppAssets.ad3Image)),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       leading: Image(image: AssetImage(AppAssets.smallRouteLogo)),
     ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 12.w,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextFormField(
                    radius: 25.r,
                    isObscureText: false,
                  borderColor: AppColors.primaryColor,
                    hintText: 'what do yo search for?',
                    hintStyle: AppStyles.light14SearchHint,
                    prefixIcon: Image(image: AssetImage(AppAssets.searchIcon)),
                  ),
                ),
                Image(image: AssetImage(AppAssets.cartIcon))
              ],
            ),
            Image(image: AssetImage(AppAssets.ad1Image)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              children: [
                Text('Categories',style: AppStyles.medium18PrimaryDark,),
                Text('view all',style: AppStyles.regular12PrimaryDark,)
              ],
            ),
            Expanded(
              child: ListView.separated(scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CategortItem(),
              itemCount: 10, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: 15.w,); },),
            )
          ],
        ),
      ),
    );
  }
}
CategortItem(){
  return Column(
    children: [
      SizedBox(
        height: 100,
        width: 100,
        child: CircleAvatar(
          child: Image(image: AssetImage(AppAssets.profileSelectedIcon)),
        ),
      ),
      Text('data',style: AppStyles.regular14PrimaryDark,)
    ],
  );
}
