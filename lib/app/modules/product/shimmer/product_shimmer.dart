import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sistema_de_controle/constants/colors.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 0.4,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Shimmer.fromColors(
                  baseColor: ResColors.shimmerBaseColor,
                  highlightColor: ResColors.shimmerHighlightColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: CircleAvatar(
                                radius: 14 * 2 + 9.0,
                                backgroundColor: Colors.brown.shade800,
                                child: Text('Product'),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                    color: Colors.white,
                                    height: 20.0,
                                    width:
                                        MediaQuery.of(context).size.width * 0.55),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    color: Colors.white,
                                    height: 20.0,
                                    width:
                                        MediaQuery.of(context).size.width * 0.45),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
