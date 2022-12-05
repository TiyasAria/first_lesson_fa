import 'package:first_lesson_fintek/model/travel.dart';
import 'package:first_lesson_fintek/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  DetailPage(this.travel, this.toggleFavorite, this.isFav);

  Travel travel;
  final Function toggleFavorite;
  final Function isFav;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Kunjungi Wisata ini di Pesona Indonesia' ,
      text: 'Wisata indah di indonesisa',
      linkUrl: widget.travel.url

    ) ;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.network(
        widget.travel.imageUrl[0],
        height: 408,
        fit: BoxFit.fill,
      ),
      Container(
        margin: EdgeInsets.only(top: 305),
        // padding: EdgeInsets.only(top: 30, left: 30),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Padding(
          padding: EdgeInsets.only(left: 30, top: 30, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      facilities('Free\nWifi', 'asset/wifi.svg'),
                      facilities('Sand\nBeach', 'asset/beach.svg'),
                      facilities('Double\nbad', 'asset/bed.svg'),
                      facilities('Bar and\nrestaurant', 'asset/resto.svg'),
                    ],
                  ),
                ),
                Row(
                  children: [
                    rating(4.5, 'asset/booking.svg', 'Booking', 300),
                    SizedBox(width: 6,) ,
                    rating(4.3, 'asset/hotelOut.svg', 'HotelOut', 350),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      widget.travel.detail,
                      style: detailText,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: widget.travel.imageUrl
                        .map((item) => Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  item,
                                  width: 150,
                                  height: 100,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: (() {
                      Navigator.pop(context);
                    }),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      size: 20,
                      color: Colors.white,
                    )),
                Row(
                  children: [
                    GestureDetector(
                      onTap: ()  => share(),
                      child: const Icon(
                        Icons.share_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.toggleFavorite(widget.travel.title);
                        });
                      },
                      child: Icon(
                        widget.isFav(widget.travel.title)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        size: 20,
                        color: widget.isFav(widget.travel.title)
                            ? Colors.redAccent
                            : Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 129),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.travel.title,
                    style: titleDetail,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text(
                        widget.travel.location,
                        style: locationTextDetail,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(children: [
                    Row(
                      children: [1, 2, 3, 4, 5].map((index) {
                        return Container(
                          margin: EdgeInsets.only(right: 2),
                          child:
                              itemRating(index, widget.travel.rating.toInt()),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      widget.travel.rating.toString(),
                      style: locationTextDetail,
                    )
                  ])
                ],
              ),
            )
          ],
        ),
      )
    ]));
  }

  Widget facilities(String title, String icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 47,
            width: 47,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xffE3E0E0)),
                borderRadius: BorderRadius.circular(50)),
            child: Center(child: SvgPicture.asset(icon))),
        SizedBox(
          height: 9,
        ),
        Text(
          title,
          style: detailText,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget rating(double rating, String icon, String title, int totalReview) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
          color: blueOld, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.only(top: 16, bottom: 16, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Color(0xffCADEE9),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: SvgPicture.asset(icon),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$title',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff4F4747))),
                    Text('$rating / 5',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff4F4747)))
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'based on $totalReview review',
              style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff4F4747)),
            )
          ],
        ),
      ),
    );
  }

  Widget itemRating(int index, int rating) {
    return Icon(
      Icons.star_rounded,
      color: index <= rating ? Colors.white : Color(0xffBDBAB2),
      size: 15,
    );
  }
}
