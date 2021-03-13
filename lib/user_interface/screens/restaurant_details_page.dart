import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grigora_coding_challenge/logic/detail_page_cubit/details_page_cubit.dart';
import 'package:grigora_coding_challenge/logic/detail_page_cubit/details_page_state.dart';
import 'package:grigora_coding_challenge/user_interface/component/drawer.dart';
import 'package:grigora_coding_challenge/user_interface/component/restaurant_card.dart';
import 'package:grigora_coding_challenge/user_interface/component/section_header.dart';
import 'package:grigora_coding_challenge/utils/constants.dart';
import '../component/details_stacked_text.dart';
import '../component/more_info.dart';
import '../component/review_row.dart';

class RestaurantDetailsPage extends StatelessWidget {
  final String restaurantName;
  final String image;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  RestaurantDetailsPage({
    this.restaurantName,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        key: _key,
        endDrawer: buildDrawer(context),
        body: SafeArea(
          child: BlocBuilder<DetailsPageCubit, DetailsPageState>(
            builder: (context, state) {
              if (state is SuccessState) {
                return _buildBody(context, state);
              } else if (state is FailureState) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error occurred'),
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<DetailsPageCubit>(context).initUI();
                          },
                          child: Text('Retry'))
                    ],
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  _buildBody(context, SuccessState state) {
    var data = state.data;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          leading: IconButton(
            icon: Icon(
              CupertinoIcons.back,
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                CupertinoIcons.bars,
              ),
              onPressed: () {
                _key.currentState.openEndDrawer();
              },
            )
          ],
          expandedHeight: MediaQuery.of(context).size.height * 0.5,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: [StretchMode.blurBackground],
            background: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.grey[900].withOpacity(0.9),
                    Colors.grey[900].withOpacity(0.9)
                  ])),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(image),
                          radius: 50,
                        ),
                      ),
                      Text(
                        restaurantName,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        data.cuisines,
                        style: TextStyle(color: Colors.white),
                      ),
                      ReviewRow(
                        review: data.totalReview.toString(),
                        rating: data.totalRating.toString(),
                      ),
                      MoreInfo(
                        onTap: () {
                          print('More Info Tapped');
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DetailsStackedText(
                            header: 'Min. Order',
                            subHeader: 'N 200',
                          ),
                          DetailsStackedText(
                            header: 'Prep. Time',
                            subHeader: '40 mins',
                          ),
                          DetailsStackedText(
                            header: 'Delivery fee',
                            subHeader: 'From N 250',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            child: Text(
                              'Start Group Order',
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            child: Text(
                              'Start Group Order',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side:
                                            BorderSide(color: Colors.white)))),
                          )
                        ],
                      ),
                      ElevatedButton(
                        child: Text(
                          'Start Group Order',
                          style: TextStyle(color: Color(0xFFE39519)),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        BorderSide(color: Color(0xFFE39519))))),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SectionHeader(
                  header: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: 'Popular ',
                          ),
                          TextSpan(
                            text: 'items',
                            style: TextStyle(
                                color: Color(0xFFE39519),
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                  subHeader:
                      'Enjoy delicious meals from restaurants \nand vendors around you',
                ),
              ),
              Container(
                height: 160,
                width: double.infinity,
                // color: Colors.black,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => RestaurantCard(
                    header: data.popularItems[index].name,
                    imageUrl: data.popularItems[index].image,
                    subHeader: data.popularItems[index].description,
                    rating: data.popularItems[index].avgRatings.toString(),
                    price: data.popularItems[index].price,
                    time: '34',
                    onTap: () {},
                  ),
                  itemCount: data.popularItems.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SectionHeader(
                  header: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: 'Featured ',
                          ),
                          TextSpan(
                            text: 'items',
                            style: TextStyle(
                                color: Color(0xFFE39519),
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                  subHeader:
                      'Enjoy delicious meals from restaurants \nand vendors around you',
                ),
              ),
              Constants.smallSpacer,
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
//Row(children: [SizedBox()],),
                    for (int i = 0; i < data.featuredItems.length; i++)
                      Container(
                        width: double.infinity,
                        child: RestaurantCard(
                          header: data.featuredItems[i].name,
                          imageUrl: data.featuredItems[i].image,
                          subHeader: data.featuredItems[i].description,
                          rating: data.featuredItems[i].avgRatings.toString(),
                          price: data.featuredItems[i].price,
                          time: '34',
                          onTap: () {},
                        ),
                      )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
