import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:sistema_de_controle/constants/colors.dart';
import 'details_creen.dart';
import 'models/product.dart';
import 'promotions_controller.dart';
import 'widgets/item_card.dart';
import 'widgets/item_card_promotions.dart';
import 'widgets/list_category.dart';

class PromotionsPage extends StatefulWidget {
  final String title;
  const PromotionsPage({Key key, this.title = "Promotions"}) : super(key: key);

  @override
  _PromotionsPageState createState() => _PromotionsPageState();
}

class _PromotionsPageState
    extends ModularState<PromotionsPage, PromotionsController> {
  final ScrollController _scrollChatController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ResColors.background,
      body: Stack(
        children: <Widget>[
          LiquidPullToRefresh(
            onRefresh: () => controller.swipeRefresh(),
            showChildOpacityTransition: false,
            animSpeedFactor: 2,
            child: CupertinoScrollbar(
              isAlwaysShown: false,
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                child: CustomScrollView(
                  controller: _scrollChatController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: <Widget>[
                    SliverToBoxAdapter(child: ItemCategory()),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Promoções",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(child: Divider()),
                    SliverToBoxAdapter(
                        child: SizedBox(
                      height: 230,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: promotions.length,
                        itemBuilder: (context, index) => ItemCardPromotions(
                          product: promotions[index],
                          press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                product: promotions[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
                    SliverToBoxAdapter(
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Divider()),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Mais produtoss",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.76,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return ItemCard(
                            product: products[index],
                            press: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    product: products[index],
                                  ),
                                )),
                          );
                        },
                        childCount: products.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
