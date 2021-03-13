import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grigora_coding_challenge/logic/detail_page_cubit/details_page_cubit.dart';
import 'package:grigora_coding_challenge/logic/home_page_cubit/home_page_cubit.dart';
import 'package:grigora_coding_challenge/logic/home_page_cubit/home_page_state.dart';
import 'package:grigora_coding_challenge/repository/providers/data_provider.dart';
import 'package:grigora_coding_challenge/user_interface/component/app_bar_title.dart';
import 'package:grigora_coding_challenge/user_interface/component/drawer.dart';
import 'package:grigora_coding_challenge/user_interface/component/restaurant_card.dart';
import 'package:grigora_coding_challenge/user_interface/component/section_header.dart';

import 'package:grigora_coding_challenge/user_interface/screens/restaurant_details_page.dart';
import 'package:grigora_coding_challenge/utils/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 300,
              color: Colors.red,
              child: Image.asset(
                'assets/grigora.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          title: AppBarTitle(),
        ),
        endDrawer: buildDrawer(context),
        body: BlocBuilder<HomePageCubit, HomePageState>(
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
                          BlocProvider.of<HomePageCubit>(context).initUI();
                        },
                        child: Text('Retry'))
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        )

        // _buildBody(context),
        );
  }

  _buildBody(BuildContext context, SuccessState state) {
    var restaurants = state.data.restaurants.toList();
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Constants.smallSpacer,
            SectionHeader(
              header: RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: 'New ',
                          style: TextStyle(
                              color: Color(0xFFE39519),
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: 'in Grigora',
                      )
                    ]),
              ),
              subHeader: 'Recently added vendors',
            ),
            Constants.smallSpacer,
            Container(
              height: 160,
              width: double.infinity,
              // color: Colors.black,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => RestaurantCard(
                  header: restaurants[index].name,
                  imageUrl: restaurants[index].image,
                  subHeader: '50 km Away',
                  rating: restaurants[index].totalRating.toString(),
                  time: '34',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider(
                            create: (_) => DetailsPageCubit(DataProvider()),
                            child: RestaurantDetailsPage(
                              restaurantName: restaurants[index].name,
                              image: restaurants[index].image,
                            )),
                      ),
                    );
                  },
                ),
                itemCount: restaurants.length,
              ),
            ),
            Constants.largeSpacer,
            SectionHeader(
              header: RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: 'Restaurants ',
                      ),
                      TextSpan(
                        text: 'Near',
                        style: TextStyle(
                            color: Color(0xFFE39519),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' You ',
                      ),
                    ]),
              ),
              subHeader:
                  'Enjoy delicious meals from restaurants \nand vendors around you',
            ),
            Constants.smallSpacer,
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Row(children: [SizedBox()],),
                  for (int i = 0; i < restaurants.length; i++)
                    Container(
                      width: double.infinity,
                      child: RestaurantCard(
                        header: restaurants[i].name,
                        imageUrl: restaurants[i].image,
                        subHeader: '50 km Away',
                        rating: restaurants[i].totalRating.toString(),
                        time: '34',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                  create: (context) =>
                                      DetailsPageCubit(DataProvider()),
                                  child: RestaurantDetailsPage(
                                      restaurantName: restaurants[i].name,
                                      image: restaurants[i].image)),
                            ),
                          );
                        },
                      ),
                    )
                ],
              ),
            ),
            Container(
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
