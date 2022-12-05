import 'package:first_lesson_fintek/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../main.dart';
import '../model/travel.dart';
import '../page/detail_page.dart';

class ItemHorizontal extends StatefulWidget {
  Travel travel;
  ItemHorizontal(this.travel); 

  @override
  State<ItemHorizontal> createState() => _ItemHorizontalState();
}

class _ItemHorizontalState extends State<ItemHorizontal> {

   

  void toggleFavorite(String title) {
    final existingIndex =
        favoriteTravel.indexWhere((travel) => travel.title == title);
    if (existingIndex >= 0) {
      setState(() {
        favoriteTravel.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteTravel
            .add(dataTravel.firstWhere((travel) => travel.title == title));
      });
    }
  }

  //  func untuk perubaahn warna
  bool isFav(String title) {
    return favoriteTravel.any((travel) => travel.title == title); 
  }

  @override
  Widget build(BuildContext context) {
    final formaterCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailPage(widget.travel, toggleFavorite, isFav)));
      },
      child: Container(
        width: 351,
        // height: 89,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: blueOld,
        ),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                child: Image.network(
                  widget.travel.imageUrl[0],
                  width: 89,
                  height: 89,
                  fit: BoxFit.fill,
                )),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 195,
                      child: Text(
                        widget.travel.title,
                        style: titleItemMain.copyWith(color: greyNew),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '10 night for two/all inclusive',
                      style: subtitleItemMain.copyWith(color: greyNew),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      formaterCurrency.format(widget.travel.price),
                      style: subtitleItemMain.copyWith(
                          color: greyNew, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(11),
              child: Container(
                width: 35,
                height: 68,
                decoration: BoxDecoration(
                    color: greenColor, borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${widget.travel.rating}',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.white,
                      size: 15,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



//  func to make currency format