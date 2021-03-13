import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grigora_coding_challenge/user_interface/component/circle_component.dart';
import 'package:grigora_coding_challenge/user_interface/component/rating_component.dart';

class RestaurantCard extends StatelessWidget {
  final String header;
  final String subHeader;
  final String rating;
  final String time;
  final String price;
  final Function onTap;
  final String imageUrl;

  const RestaurantCard(
      {@required this.onTap,
      this.header,
      this.subHeader,
      this.rating,
      this.time,
      this.price,
      this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 150,
        child: Card(
          color: Color(0xFFFAFAFA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: 120,
              width: 310,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: Container(
                      height: 200,
                      width: 120,
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            header,
                            maxLines: 1,
                            style: TextStyle(
                                color: Color(0xFF757575),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            subHeader,
                            maxLines: 2,
                          ),
                          Row(
                            children: [
                              RatingComponent(
                                rating: rating,
                              ),
                              time != null ? CircleComponent() : SizedBox(),
                              time != null ? Text('$time Mins') : SizedBox(),
                            ],
                          ),
                          price != null ? Text('N $price') : SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
