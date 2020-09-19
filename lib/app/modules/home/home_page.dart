import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sistema_de_controle/app/modules/category/category_module.dart';
import 'package:sistema_de_controle/app/modules/chat/chat_module.dart';
import 'package:sistema_de_controle/app/modules/client/client_module.dart';
import 'package:sistema_de_controle/app/modules/order/order_module.dart';
import 'package:sistema_de_controle/app/modules/product/product_module.dart';
import 'package:sistema_de_controle/app/modules/promotions/promotions_module.dart';
import 'package:sistema_de_controle/app/modules/providers/providers_module.dart';
import 'package:sistema_de_controle/app/modules/sales/sales_module.dart';
import 'package:sistema_de_controle/app/widgets/custom_drawer.dart';
import 'package:sistema_de_controle/constants/colors.dart';
import 'controller_page_store.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final PageController _pageControle = PageController();
  final ControllerPageStore pageStore = GetIt.I<ControllerPageStore>();
  @override
  void initState() {
    super.initState();

    reaction(
      (_) => pageStore.page,
      (page) => _pageControle.jumpToPage(page),
    );
  }

  @override
  Widget build(BuildContext context) {
    List widgetsList = [
      PromotionsModule(),
      CategoryModule(),
      ProductModule(),
      OrderModule(),
      SalesModule(),
      ClientModule(),
      ChatModule(),
      ProvidersModule(),
    ];
    List titles = ['Promoções','Categorias','Produtos','Orçamentos', 'Vendas', 'Clientes', 'Chat','Fornecedor'];
    return SafeArea(
      child: Scaffold(
        backgroundColor: ResColors.background,
        drawer: CustomDrawer(),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.3,
          title: Observer(
            builder: (BuildContext context) {
              return Text(titles[pageStore.page]);
            },
          ),
        ),
        body: Observer(
          builder: (BuildContext context) {
            return widgetsList[pageStore.page];
          },
        ),
      ),
    );
  }
}
