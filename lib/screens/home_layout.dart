import 'package:flutter/material.dart';
import 'package:untitled8/components.dart';
import 'package:untitled8/config/colors.dart';
import 'package:untitled8/config/constants.dart';
import '../config/images.dart';


class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.cardColor,

        bottomNavigationBar:
            Container(
              padding:EdgeInsets.all(10),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(Constants.secondaryPadding),
                topRight: Radius.circular(Constants.secondaryPadding)
                )
              ),
              child: BottomNavigationBar(
                showUnselectedLabels: false,
                backgroundColor: Colors.white,
                items: [
                BottomNavigationBarItem(icon:Image.asset(AppImages.categories,
                scale: Constants.scale,),
                label: "Categories"
                ),
                BottomNavigationBarItem(icon: Image.asset(AppImages.compass,scale:  Constants.scale),
                    label: "Map"
                ),
                BottomNavigationBarItem(icon: Image.asset(AppImages.receipt,scale:  Constants.scale),
                    label: "Receipt"
                ),
                BottomNavigationBarItem(icon: Image.asset(AppImages.user,scale:  Constants.scale),
                    label: "User"
                ),
              ],
                currentIndex:currentIndex ,
                onTap: (index){
                setState(() {
                  currentIndex=index;
                });
                },
                selectedItemColor: AppColors.primaryColor,
                elevation: 0,
                selectedIconTheme: IconThemeData(
                  color: AppColors.primaryColor
                ),
                type: BottomNavigationBarType.fixed,

              ),
            ),

        body: SafeArea(child: screens[currentIndex])
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}