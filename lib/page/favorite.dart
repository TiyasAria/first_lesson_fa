import 'package:first_lesson_fintek/model/travel.dart';
import 'package:first_lesson_fintek/widget/item_horizontal.dart';
import 'package:flutter/material.dart';

import '../theme/style.dart';

class FavoritePage extends StatelessWidget {
   FavoritePage(this.favoriteTravel); 
  List<Travel> favoriteTravel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.only(top: 30, left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find the favorite  tour',
                style: titleMain,
              ),
              SizedBox(
                height: 5,
              ),
              favoriteTravel.isEmpty ?
               Center(
                  child: Text('Anda tidak memiliki travel favorite' ,style: titleItemMain,),
               ) 
               : Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: favoriteTravel.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 30, bottom: 18),
                      child: ItemHorizontal(favoriteTravel[index]),
                    );
                  },
                  ),
               )
            ],
          ),
        ),
      ),
    );
  }
}
