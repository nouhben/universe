import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:universe/constants.dart';
import 'package:universe/data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGradientEndColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kGradientStartColor, kGradientEndColor],
            stops: [0.3, 0.7],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xffFFFFFF),
                        fontSize: 44.0,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    DropdownButton(
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Solar System',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0x7cdbf1ff),
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Image.asset('images/drop_down_icon.png'),
                      ),
                      underline: SizedBox(),
                    ),
                  ],
                ),
              ),
              Container(
                height: 500.0,
                padding: EdgeInsets.only(left: 20.0),
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 100.0),
                            Card(
                              elevation: 8.0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 100.0),
                                    Text(
                                      planets[index].name,
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 44.0,
                                        fontWeight: FontWeight.w900,
                                        color: const Color(0xff47455f),
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      'Solar System',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 23.0,
                                        fontWeight: FontWeight.w500,
                                        color: kPrimaryTextColor,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(height: 32.0),
                                    Row(
                                      children: [
                                        Text(
                                          'Know more',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                            color: kSecondaryTextColor,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: kSecondaryTextColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(planets[index].iconImage),
                      ],
                    );
                  },
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeSize: 20.0,
                      space: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: kNavigationColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36.0),
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Image.asset('images/menu_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('images/search_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('images/profile_icon.png'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
