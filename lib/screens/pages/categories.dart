
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled8/components.dart';
import 'package:untitled8/config/constants.dart';
import 'package:untitled8/screens/best_partners.dart';
import 'package:untitled8/screens/restaurant_screen.dart';
import '../../config/colors.dart';
import '../../config/images.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>{

bool showBottom=false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(Constants.secondaryPadding),
          height: height * .25,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.bgColor,
                  borderRadius:BorderRadius.only(
                  bottomLeft:  Radius.circular(Constants.secondaryPadding),
                  bottomRight: Radius.circular(Constants.secondaryPadding)
                  ),
          ),
          child: Column(
            children: [
             SearchField(),
              ListTile(
                leading: Padding(
                  padding:
                      const EdgeInsets.only(top: 15, right: 15, bottom: 15),
                  child: Image.asset(
                    AppImages.locationArrow,
                    scale: Constants.scale,
                  ),
                ),
                title: Text(
                  "Delivery to",
                  style: TextStyle(color: AppColors.primaryColor),
                ),
                subtitle: Row(
                  children: [
                    DropdownButton(
                      items: [
                        DropdownMenuItem(child: Text("Mansoura")),
                      ],
                      onChanged: (index) {
                      },
                      iconSize: 30,
                      underline: Container(),
                      dropdownColor: AppColors.primaryColor,
                    )
                  ],
                ),
                trailing: GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      transitionDuration: Duration(milliseconds: 500),
                      barrierLabel: MaterialLocalizations.of(context).dialogLabel,
                      barrierColor: Colors.black.withOpacity(0.5),
                      pageBuilder: (context, _, __) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Card(
                                child: ListView(
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    ListTile(
                                      title: Text('Item 1'),
                                      onTap: () => Navigator.of(context).pop('item1'),
                                    ),
                                    ListTile(
                                      title: Text('Item 2'),
                                      onTap: () => Navigator.of(context).pop('item2'),
                                    ),
                                    ListTile(
                                      title: Text('Item 3'),
                                      onTap: () => Navigator.of(context).pop('item3'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      transitionBuilder: (context, animation, secondaryAnimation, child) {
                        return SlideTransition(
                          position: CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeOut,
                          ).drive(Tween<Offset>(
                            begin: Offset(0, -1.0),
                            end: Offset.zero,
                          )),
                          child: child,
                        );
                      },
                    );
                  },
                  child: RatingCard(
                    text: "Filter",
                    image: AppImages.filter,
                    color: AppColors.cardColor,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(Constants.mainPadding),
          margin: const EdgeInsets.all(10),
          width: width,
          height: height * .35,
          decoration: BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: BorderRadius.circular(Constants.mainPadding)),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Category",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {  },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black
                    ),
                    child: Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.categoryColor,
                        child: Image.asset(
                          AppImages.pizza,
                          scale: Constants.scale,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Pizza")
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.categoryColor,
                        child: Image.asset(
                          AppImages.sandwiches,
                          scale: Constants.scale,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Sandwiches")
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.categoryColor,
                        child: Image.asset(
                          AppImages.burgers,
                          scale: Constants.scale,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Burgers")
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(Constants.mainPadding),
          margin: const EdgeInsets.all(10),
          width: width,
          height: height * .4,
          decoration: BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: BorderRadius.circular(Constants.mainPadding)),
          child: Stack(
            children: [
              Row(
                children: [
                  Text(
                    "Best partners",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed:(){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context)=>BestPartenersScreen())
                      );
                    },
                    child: Text(
                      "See all",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16

                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                  top: 50,
                  child: Container(
                    width: width,
                    height: 1,
                    color: Colors.grey[300],
                  )),
              Positioned(
                bottom: 80,
                child: SizedBox(
                  height: 150,
                  width: width,
                  child: CarouselSlider(
                      items: List.generate(
                          10,
                          (index) => Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 230,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Constants.mainPadding)),
                                      child: Image.asset(
                                        AppImages.subway,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              )),
                      options: CarouselOptions(
                          autoPlay: true,
                          disableCenter: true,
                          padEnds: false,
                          viewportFraction: .7)),
                ),
              ),
              Positioned(
                bottom: 80,
                child:RestaurantName(text: "Subway",)
              ),
              Positioned(
                bottom: 60,
                child: RestaurantStates(state: "Open",
                address: "Mansoura Al Huda we El Nour st.",
                )
              ),
              Positioned(
                bottom: 10,
                child: Row(
                  children: [
                    RatingCard(
                      height: 40,
                      width: 60,
                      radius: 20,
                      text: "5.0",
                      image: AppImages.star,
                      color: AppColors.primaryColor,
                      textColor: Colors.white,
                    ),
                    Text(" 1.5 km "),
                    Text("• "),
                    Text("Free shipping"),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(Constants.mainPadding),
          child: RestaurantsView(
            widget: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => RestaurantCard(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RestaurantScreen()));
                  },
                    image: AppImages.burgerKing,
                    restaurantName: "Burger King",
                    restaurantState: "Open",
                    meals: ["Rice", "Spagetti", "Sushi"],
                    rating: "4.5",
                    space: "12 km",
                    shippingState: "free shipping"),
                separatorBuilder: (context, index) => Divider(),
                itemCount: 10),
          ),
        ),
      ],
    ),
      );
  }


}
