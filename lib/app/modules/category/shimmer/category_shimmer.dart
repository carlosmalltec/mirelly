import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sistema_de_controle/constants/colors.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                  color: Colors.white,
                                  height: 20.0,
                                  width: MediaQuery.of(context).size.width * 0.85
                              ),
                              SizedBox(height: 10,),
                              Container(
                                  color: Colors.white,
                                  height: 20.0,
                                  width: MediaQuery.of(context).size.width * 0.75
                              ),
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
        });

    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Shimmer.fromColors(
              baseColor: ResColors.shimmerBaseColor,
              highlightColor: ResColors.shimmerHighlightColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 80.0,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                color: Colors.white,
                                height: 20.0,
                                width: MediaQuery.of(context).size.width * 0.65
                            ),
                            SizedBox(height: 10,),
                            Container(
                                color: Colors.white,
                                height: 20.0,
                                width: MediaQuery.of(context).size.width * 0.55
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        childCount: 5,
      ),
    );
  }
}