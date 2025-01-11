import 'package:flutter/material.dart';

import 'config/images.dart';

class MealCard extends StatelessWidget {
  const MealCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.asset(AppImages.burgers,
            scale: 1.5,),
            height: 150,
            width:150,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(20)
            ),
          ),
          Text("aksalksakslfalskfsasfkaslfkasf",overflow: TextOverflow.ellipsis,
          maxLines: 1,
          )
        ],
      ),
    );
  }
}
