import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plypicker_app/constants/text_styles.dart';
import 'package:plypicker_app/providers/fav_mb_provider.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  FavModularBathroomsProvider favModularBathroomsProvider =
      FavModularBathroomsProvider();

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final _mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
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
                        // fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                );
              }),
            ),

            ///List of favourite items

            Expanded(
              child: LayoutBuilder(
                builder: ((context, constraints) {
                  return context
                          .watch<FavModularBathroomsProvider>()
                          .favMBList
                          .isEmpty
                      ? Container(
                          // color: Colors.amber.withOpacity(0.3),
                          margin: EdgeInsets.all(constraints.maxHeight * 0.023),
                          height: constraints.maxHeight * 0.05,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // margin: EdgeInsets.only(
                                //     top: constraints.maxHeight * 0.3),
                                child: Text(
                                  'Your wishlist is empty.',
                                  style: kProductNameTextStyle.copyWith(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: isLandscape
                                        ? constraints.maxHeight * 0.065
                                        : constraints.maxHeight * 0.035,
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(
                                    top: constraints.maxHeight * 0.02,
                                  ),
                                  height: isLandscape
                                      ? constraints.maxHeight * 0.4
                                      : constraints.maxHeight * 0.15,
                                  child: Image.asset('assets/images/inbox.png',
                                      color: Colors.black.withOpacity(0.5)))
                            ],
                          ),
                        )
                      : Container(
                          // color: Colors.black,
                          margin: EdgeInsets.only(
                              left: isLandscape
                                  ? constraints.maxWidth * 0.02
                                  : constraints.maxWidth * 0.04,
                              right: isLandscape
                                  ? constraints.maxWidth * 0.02
                                  : constraints.maxWidth * 0.04,
                              top: constraints.maxHeight * 0.025),
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                    // color: Colors.amber.withOpacity(0.3),
                                    height: isLandscape
                                        ? constraints.maxHeight * 0.32
                                        : constraints.maxHeight * 0.16,
                                    width: constraints.maxWidth,
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  // color: Colors.red
                                                  //     .withOpacity(0.4),
                                                  height: constraints.maxHeight,
                                                  width: constraints.maxWidth *
                                                      0.23,
                                                  child: Image.network(
                                                    '${context.watch<FavModularBathroomsProvider>().favMBList[index].productImage}',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        top: constraints
                                                                .maxHeight *
                                                            0.2,
                                                        left: constraints
                                                                .maxWidth *
                                                            0.03),
                                                    // color: Colors.purple
                                                    //     .withOpacity(0.3),
                                                    height:
                                                        constraints.maxHeight,
                                                    width:
                                                        constraints.maxWidth *
                                                            0.6,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          child: Text(
                                                            '${context.watch<FavModularBathroomsProvider>().favMBList[index].productName}',
                                                            style: kProductNameTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        constraints.maxHeight *
                                                                            0.14),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(
                                                              top: constraints
                                                                      .maxHeight *
                                                                  0.02),
                                                          child: Text(
                                                            '${context.watch<FavModularBathroomsProvider>().favMBList[index].brand}',
                                                            style: kBrandTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        constraints.maxHeight *
                                                                            0.13),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(
                                                              top: constraints
                                                                      .maxHeight *
                                                                  0.11),
                                                          child: Text(
                                                            'Rs. ${_addComma(context.watch<FavModularBathroomsProvider>().favMBList[index].discountedPrice)}',
                                                            style: kDiscountedPriceTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        constraints.maxHeight *
                                                                            0.13),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: constraints.maxHeight *
                                                      0.2),
                                              alignment: Alignment.topCenter,
                                              // color:
                                              //     Colors.blue.withOpacity(0.2),
                                              height: constraints.maxHeight,
                                              child: Icon(
                                                Icons.favorite_rounded,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ));
                              },
                              separatorBuilder: (context, index) => Container(
                                    child: Container(
                                        height: constraints.maxHeight * 0.04,
                                        width: constraints.maxWidth,
                                        // color: Colors.blueGrey.withOpacity(0.5),
                                        child: Divider(
                                          thickness: 2,
                                          color: Colors.grey[300],
                                        )),
                                  ),
                              itemCount: context
                                  .watch<FavModularBathroomsProvider>()
                                  .favMBList
                                  .length),
                        );
                }),
              ),
            ),

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
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.home_outlined,
                            color: Colors.black87.withOpacity(0.8),
                            size: constraints.maxHeight * 0.8,
                          ),
                        ),
                        Icon(
                          Icons.favorite_outline_rounded,
                          color: Colors.black87.withOpacity(0.8),
                          size: constraints.maxHeight * 0.7,
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
