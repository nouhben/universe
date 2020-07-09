import 'package:flutter/material.dart';
import 'package:universe/constants.dart';
import 'package:universe/data.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;
  DetailPage({this.planetInfo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 200.0),
                        Text(
                          this.planetInfo.name,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 56.0,
                            fontWeight: FontWeight.w900,
                            color: kPrimaryTextColor,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Solar System',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 31.0,
                            fontWeight: FontWeight.w300,
                            color: kContentTextColor,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 32.0),
                        Text(
                          planetInfo.description ?? '',
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: kContentTextColor,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 32.0),
                        Divider(color: Colors.black38),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32.0, bottom: 32.0),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 25.0,
                        fontWeight: FontWeight.w300,
                        color: kPrimaryTextColor,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 200.0,
                    padding: EdgeInsets.only(left: 32.0, bottom: 32.0),
                    child: ListView.builder(
                      itemCount: planetInfo.images.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: AspectRatio(
                              aspectRatio: 1.0,
                              child: Image.network(
                                planetInfo.images[index],
                                fit: BoxFit.cover,
                              )),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: -64.0,
              child: Hero(
                tag: planetInfo.position,
                child: Image.asset(planetInfo.iconImage),
              ),
            ),
            Positioned(
              top: 60.0,
              left: 32.0,
              child: Text(
                this.planetInfo.position.toString(),
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 256.0,
                  fontWeight: FontWeight.w900,
                  color: kPrimaryTextColor.withOpacity(0.08),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
