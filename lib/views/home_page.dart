import 'package:flutter/material.dart';
import 'package:plypicker_app/constants/text_styles.dart';
import 'package:plypicker_app/models/modular_bathroom.dart';
import 'package:plypicker_app/models/modular_bathroom_list.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:plypicker_app/providers/fav_mb_provider.dart';
import 'package:plypicker_app/views/favourite_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ModularBathroom> modularBathroomList =
      ModularBathroomList.modularBathroomObjects;

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final _mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            ///Top bar

            Container(
              color: Colors.white,
              width: _mediaQuery.size.width,
              height: isLandscape
                  ? _mediaQuery.size.height * 0.1
                  : _mediaQuery.size.height * 0.06,
              child: LayoutBuilder(builder: (context, constraints) {
                return Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                      left: isLandscape
                          ? constraints.maxWidth * 0.02
                          : constraints.maxWidth * 0.03),
                  padding: EdgeInsets.only(top: constraints.maxHeight * 0.1),
                  color: Colors.white,
                  child: Text(
                    'PLYPICKER',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: constraints.maxHeight * 0.6,
                        fontFamily: 'RollenstonSemiBold',
                        color: Colors.black),
                  ),
                );
              }),
            ),

            ///List of all items

            Expanded(child: LayoutBuilder(
              builder: ((context, constraints) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: constraints.maxHeight * 0.0025,
                        crossAxisSpacing: constraints.maxHeight * 0.0025,
                        crossAxisCount: 2,
                        childAspectRatio: isLandscape
                            ? constraints.maxWidth * 0.9 / constraints.maxHeight
                            : constraints.maxWidth *
                                1.25 /
                                constraints.maxHeight),
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            color: Colors.blue,
                            height: constraints.maxHeight / 3.32,
                            width: constraints.maxWidth,
                            child: Image.network(
                              modularBathroomList[index].productImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                              color: Colors.white,
                              width: constraints.maxWidth,
                              height: isLandscape
                                  ? constraints.maxHeight / 4
                                  : constraints.maxHeight / 10.34,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Container(
                                    padding: EdgeInsets.only(
                                      left: constraints.maxWidth * 0.02,
                                      right: constraints.maxWidth * 0.02,
                                      top: constraints.maxHeight * 0.02,
                                      bottom: constraints.maxHeight * 0.01,
                                    ),
                                    // ignore: avoid_unnecessary_containers
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Text(
                                                  modularBathroomList[index]
                                                      .productName,
                                                  style: kProductNameTextStyle
                                                      .copyWith(
                                                          fontSize: constraints
                                                                  .maxHeight *
                                                              0.23),
                                                ),
                                              ),
                                              Container(
                                                child: GestureDetector(
                                                    onTap: () {
                                                      bool checkLiked =
                                                          modularBathroomList[
                                                                  index]
                                                              .fav;
                                                      if (checkLiked == false) {
                                                        setState(() {
                                                          modularBathroomList[
                                                                  index]
                                                              .fav = true;
                                                        });
                                                        context
                                                            .read<
                                                                FavModularBathroomsProvider>()
                                                            .addItem(
                                                                modularBathroomList[
                                                                    index]);
                                                      } else if (checkLiked ==
                                                          true) {
                                                        setState(() {
                                                          modularBathroomList[
                                                                  index]
                                                              .fav = false;
                                                        });
                                                        context
                                                            .read<
                                                                FavModularBathroomsProvider>()
                                                            .removeItem(
                                                                modularBathroomList[
                                                                    index]);
                                                      }
                                                    },
                                                    child: Icon(
                                                        (modularBathroomList[
                                                                        index]
                                                                    .fav ==
                                                                true)
                                                            ? Icons.favorite
                                                            : Icons
                                                                .favorite_border_outlined,
                                                        color:
                                                            (modularBathroomList[
                                                                            index]
                                                                        .fav ==
                                                                    true)
                                                                ? Colors.red
                                                                : Colors.grey)),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            child: Text(
                                                modularBathroomList[index]
                                                    .brand,
                                                style: kBrandTextStyle.copyWith(
                                                    fontSize:
                                                        constraints.maxHeight *
                                                            0.17)),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                child: Text(
                                                    'Rs. ${_addComma(modularBathroomList[index].discountedPrice)}',
                                                    style: kDiscountedPriceTextStyle
                                                        .copyWith(
                                                            fontSize: constraints
                                                                    .maxHeight *
                                                                0.19)),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        constraints.maxWidth *
                                                            0.018,
                                                    vertical:
                                                        constraints.maxHeight *
                                                            0.009),
                                                child: Text(
                                                  'Rs. ${_addComma(modularBathroomList[index].originalPrice)}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontSize: constraints
                                                              .maxHeight *
                                                          0.155,
                                                      color: Colors.grey[500],
                                                      fontFamily:
                                                          'IndianMedium'),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  '-${_addComma(modularBathroomList[index].discountPercentage)}%',
                                                  style: TextStyle(
                                                      fontSize: constraints
                                                              .maxHeight *
                                                          0.22,
                                                      color: Colors.green,
                                                      fontFamily: 'Indian'),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: constraints.maxHeight * 0.2,
                                            width: constraints.maxWidth * 0.8,
                                            child: RatingBarIndicator(
                                              rating: modularBathroomList[index]
                                                  .rating,
                                              itemBuilder: (context, index) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.orangeAccent,
                                              ),
                                              itemCount: 5,
                                              itemSize: 10.0,
                                              direction: Axis.horizontal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )),
                        ],
                      );
                    });
              }),
            )),

            ///Bottom navigation bar

            Container(
              color: Colors.white,
              width: _mediaQuery.size.width,
              height: isLandscape
                  ? _mediaQuery.size.height * 0.1
                  : _mediaQuery.size.height * 0.06,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth * 0.18,
                        vertical: constraints.maxHeight * 0.1),
                    height: constraints.maxHeight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: Colors.black87.withOpacity(0.8),
                          size: constraints.maxHeight * 0.8,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FavouritePage(),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.favorite_outline_rounded,
                            color: Colors.black87.withOpacity(0.8),
                            size: constraints.maxHeight * 0.7,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// method to add comma in prices

  String _addComma(int amount) {
    var price = NumberFormat('#,##,###');
    String a = price.format(amount);
    return a;
  }
}
