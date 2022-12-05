import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_stack/image_stack.dart';

import '../theme/style.dart';

Widget itemVertical(
    BuildContext context, String imgUrl, String title, double rating) {
  List<String> images = [
   'https://images.unsplash.com/photo-1664575602554-2087b04935a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1664575602554-2087b04935a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
  ];
  return Stack(
    children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            imgUrl,
            width: 137,
            height: 194,
            fit: BoxFit.fill,
          )),
      Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(

                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      child: Stack(children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 5,
                          ),
                          child: Container(
                            height: 17,
                            width: 34,
                          ),
                        ),
                        Container(
                          height: 17,
                          width: 34,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.4),
                                  Colors.white.withOpacity(0.2)
                                ],
                                stops: [0.2, 1.0],
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              'New',
                              style: locationTextDetail,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(width: 42,),
                  ImageStack(
                      imageList: images,
                      totalCount: images.length,
                    imageRadius: 15,
                    imageCount: 3,
                    imageBorderWidth: 0.1,

                  )
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 85,
                          child: Text(
                            title,
                            style:
                                titleItemMain.copyWith(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )),
                      Text('18 Tours',
                          style:
                              subtitleItemMain.copyWith(color: Colors.white))
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      child: Stack(children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 5,
                          ),
                          child: Container(
                            height: 40,
                            width: 20,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 20,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.4),
                                  Colors.white.withOpacity(0.2)
                                ],
                                stops: [0.2, 1.0],
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('$rating',
                                  style: GoogleFonts.poppins(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                              const Icon(
                                Icons.star_rounded,
                                color: Colors.white,
                                size: 7,
                              )
                            ],
                          ),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            ],
          ))
    ],
  );
}

// CircleAvatar itemPerson(String item) {
//   return CircleAvatar(
//     child: Image.network(
//         width: 15,
//         height: 15,
//       item),
//   );
// }
