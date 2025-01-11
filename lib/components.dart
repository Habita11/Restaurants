import 'package:flutter/material.dart';
import 'package:untitled8/screens/best_partners.dart';
import 'package:untitled8/screens/pages/categories.dart';
import 'package:untitled8/screens/pages/map.dart';
import 'package:untitled8/screens/pages/receipt.dart';
import 'package:untitled8/screens/pages/user.dart';

import 'config/colors.dart';
import 'config/constants.dart';
import 'config/images.dart';

List<Widget> screens = [
  CategoriesScreen(),
  MapScreen(),
  ReceiptScreen(),
  UserScreen()
];

class RatingCard extends StatelessWidget {
  String text;
  String image;
  var color;
  var textColor;
  double height;
  double width;
  double radius;

  RatingCard({required this.text,
    required this.image,
    required this.color,
    this.width = 80,
    this.height = 40,
    this.radius = 20,
    this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Stack(
          children: [
           Align(
             alignment: Alignment.centerLeft,
              child: Image.asset(
                image,
                scale: Constants.scale,
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(color: textColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RestaurantsView extends StatelessWidget {
  Widget widget;
  RestaurantsView(
  {
    required this.widget
}
      );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
                      text: "Nearby",
                    ),
                    Tab(
                      text: "Sales",
                    ),
                    Tab(
                      text: "Rate",
                    ),
                    Tab(
                      text: "Fast",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                child: TabBarView(
                  children: [
                    widget,
                    widget,
                    widget,
                    widget
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {

  String image;
  String restaurantName;
  String restaurantState;
  List<String> meals;
  String rating;
  String space;
  String shippingState;
  Function()? onTap;

  RestaurantCard({

    required this.image,
    required this.restaurantName,
    required this.restaurantState,
    required this.meals,
    required this.rating,
    required this.space,
    required this.shippingState,
    required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
            color: AppColors.bgColor,
            borderRadius: BorderRadius.circular(Constants.mainPadding)),
        child: Stack(
          children: [
            Positioned(
              bottom: 100,
              top: 10,
              right: 10,
              left: 10,
              child: Container(
                child: Image.asset(image),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Constants.mainPadding),
                ),
              ),
            ),
            Positioned(
              bottom: 70,
              left: 10,
              child: RestaurantName(text: restaurantName,)
            ),
            Positioned(
                bottom: 45,
                left: 10,
                child: Row(
                  children: [
                    Text(
                      "$restaurantState • ",
                      style: TextStyle(color: Colors.green),
                    ),
                    SizedBox(
                      height: 20,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Text(meals[index]),
                          separatorBuilder: (context, index) => Text(" • "),
                          itemCount: meals.length),
                    )
                  ],
                )),
            Positioned(
              left: 10,
              bottom: 0,
              child: Row(
                children: [
                  RatingCard(
                    height: 30,
                    width: 55,
                    radius: 15,
                    text: rating,
                    image: AppImages.star,
                    color: AppColors.primaryColor,
                    textColor: Colors.white,
                  ),
                  Text(space),
                  Text(" • "),
                  Text(shippingState),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          floatingLabelStyle:
          TextStyle(color: AppColors.primaryColor),
          border: OutlineInputBorder(
              borderSide:
              BorderSide(width: 0, style: BorderStyle.none)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          labelText: "Search on Cook",
          prefixIcon: Image.asset(
            AppImages.locationMark,
            scale: Constants.scale,
          ),
          focusColor: Colors.grey,
        ),
      ),
    );
  }
}

class RestaurantName extends StatelessWidget {
  String text;
 RestaurantName({
   required this.text
});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(
          width: 3,
        ),
        Image.asset(
          AppImages.shield,
          scale: Constants.scale,
        )
      ],
    );
  }
}


class RestaurantStates extends StatelessWidget {
  String state;
  String address;
  RestaurantStates({
    required this.state,
    required this.address
});
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: "$state • ",
          style: TextStyle(color: Colors.green),
          children: [
            TextSpan(
                text: address,
                style: TextStyle(color: Colors.grey))
          ]),
    );
  }
}

