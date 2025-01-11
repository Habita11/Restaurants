import 'package:flutter/material.dart';
import 'package:untitled8/screens/restaurant_screen.dart';

import '../components.dart';
import '../config/images.dart';

class BestPartenersScreen extends StatelessWidget {
  const BestPartenersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Best Partners",),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => RestaurantCard(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder:(context)=>RestaurantScreen() ));
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

    );
  }
}
