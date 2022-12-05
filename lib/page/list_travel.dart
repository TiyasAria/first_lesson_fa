import 'package:flutter/material.dart';

import '../model/travel.dart';
import '../theme/style.dart';
import '../widget/item_horizontal.dart';
import '../widget/item_vertical.dart';

class ListTravel extends StatelessWidget {
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F8FD),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find the best  tour',
                style: titleMain,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Country',
                style: subtitleMain,
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                height: 195,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: ItemVertical(dataTravel[index]),
                    );
                  },
                  itemCount: dataTravel.length,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Popular Tours',
                style: subtitleMain,
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                height: 500,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16, right: 30),
                      child: ItemHorizontal(dataTravel[index]),
                    );
                  },
                  itemCount: dataTravel.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
