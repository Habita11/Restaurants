import 'package:flutter/material.dart';
import 'package:untitled8/components.dart';
import 'package:untitled8/config/colors.dart';
import 'package:untitled8/meal_card.dart';
import '../config/constants.dart';
import '../config/images.dart';

class RestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        Image.asset(AppImages.restaurantImage,
        height: 300,
        fit: BoxFit.cover,
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.all(30),
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              RestaurantName(text: "Burger King"),
          SizedBox(height: 10,),
          RestaurantStates(
              state: "Open", address: "Al huda we El Nour, Mansoura"),
          Divider(),
          RatingCard(text: "4.3",
            image: AppImages.star,
            color: AppColors.primaryColor,
            textColor: Colors.white,
            height: 30,
            radius: 15,
            width: 60,
          ),
          SizedBox(height: 10,),
          SearchField(),
          DefaultTabController(
            length: 2,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.bgColor,
                  borderRadius: BorderRadius.circular(Constants.mainPadding)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: TabBar(
                        indicator: UnderlineTabIndicator(
                            borderSide:
                            BorderSide(color: AppColors.primaryColor, width: 2),
                            insets: EdgeInsets.only(
                                left: Constants.mainPadding,
                                right: Constants.mainPadding)),
                        labelColor: AppColors.primaryColor,
                        indicatorColor: AppColors.primaryColor,
                        unselectedLabelColor: Colors.black87,
                        tabs: [
                          Tab(
                            text: "Delivery",
                          ),
                          Tab(
                            text: "Review",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: TabBarView(
                        children: [
                         MealCard(),
                         MealCard(),


                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )

          ],
        ),
      ),
    )],
    )
    ,
    );
  }
}
