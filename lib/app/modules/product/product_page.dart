import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sistema_de_controle/app/modules/models/product.dart';
import 'package:sistema_de_controle/app/modules/product/validate_form_controller.dart';
import 'package:sistema_de_controle/app/widgets/actions_button.dart';
import 'package:sistema_de_controle/app/widgets/item_not_found.dart';
import 'package:sistema_de_controle/app/widgets/loading_status.dart';
import 'package:sistema_de_controle/constants/colors.dart';
import 'package:sistema_de_controle/constants/drawables.dart';
import 'form_product.dart';
import 'product_controller.dart';
import 'shimmer/product_shimmer.dart';

class ProductPage extends StatefulWidget {
  final String title;
  const ProductPage({Key key, this.title = "Product"}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends ModularState<ProductPage, ProductController>
    with WidgetsBindingObserver {
  final ScrollController _scroll = ScrollController();

  final ValidateFormController _validateForm = ValidateFormController();

  @override
  void initState() {
    controller.getFirstPage(true);
    _scroll.addListener(() {
      controller.onScroll(
          _scroll.position.pixels, _scroll.position.maxScrollExtent);
    });
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.swipeRefresh(),
      child: Scaffold(
        backgroundColor: ResColors.background,
        body: Column(
          children: <Widget>[
            Observer(
              builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center, //centraliza
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RaisedButton.icon(
                      onPressed: () {
                        controller.setChangeForm();
                        controller.isFormEditProduct =
                            false; //habilita mais campos
                      },
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Novo',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RaisedButton.icon(
                      onPressed: controller.setChangeList,
                      icon: Icon(
                        Icons.view_list,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Lista',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                );
              },
            ),
            Divider(
              color: Theme.of(context).accentColor,
            ),
            Observer(
              builder: (_) {
                controller.isExpandedProduct; //action for change expanded list
                if (controller.isChangeScreenProduct)
                  return Expanded(child: FormProduct(controller: controller));
                if ((controller.isLoading == LoadingStatus.notLoading) ||
                    (controller.isLoading == LoadingStatus.nextPageLoading)) {
                  if (controller.listDataProduct.length == 0) {
                    return Expanded(
                      child: ItemNotFound(
                        text: 'Product não localizado!',
                        icon: Drawables.notFound,
                      ),
                    );
                  } else {
                    return Expanded(
                      child: CupertinoScrollbar(child: _listProduct(_scroll)),
                    );
                  }
                } else {
                  if (controller.isLoading == LoadingStatus.shimmerLoading) {
                    return Expanded(child: ProductShimmer());
                  } else {
                    return Expanded(
                      child: Container(child: CupertinoActivityIndicator()),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  ListView _listProduct(ScrollController scroll) {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: controller.listDataProduct.length,
        itemBuilder: (BuildContext context, int index) {
          var _products = controller.listDataProduct[index];
          var _change = controller.isExpandedMapProduct[_products.id];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ExpansionPanelList(
              key: ValueKey<String>(_products.id),
              expansionCallback: (int index, bool isExpanded) {
                controller.isExpandedProduct = isExpanded;
                controller.changeIsExpanded(_products.id, isExpanded);
              },
              children: [
                ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          leading: Icon(Icons.brightness_1,
                              color: _products.status != ProductStatus.ATIVO
                                  ? Colors.redAccent
                                  : Colors.green),
                          title: Text(
                            _products.title ?? "",
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ));
                    },
                    isExpanded: _change ?? false,
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Data da compra',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' 12/12/2020 \n'),
                              TextSpan(
                                  text: 'Valor da compra',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' R\$: 67,00 \n'),
                              TextSpan(
                                  text: 'Quantidade',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' 120 \n'),
                              TextSpan(
                                  text: 'Total',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' 150,99 \n'),
                              TextSpan(text: ' ---------------------'),
                            ],
                          ),
                          style: TextStyle(fontSize: 16),
                          maxLines: 5,
                        ),
                        AutoSizeText.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Margem de lucro',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' 400% \n'),
                              TextSpan(
                                  text: 'Valor de venda',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' 190,00 \n'),
                              TextSpan(
                                  text: 'Estoque atual',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' 145 \n'),
                              TextSpan(text: ' ---------------------'),
                            ],
                          ),
                          style: TextStyle(fontSize: 16),
                          maxLines: 5,
                        ),

                        AutoSizeText.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Categoria',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' Creme \n'),
                              TextSpan(
                                  text: 'Fornecedor',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' AVON \n'),
                              TextSpan(text: ' ---------------------'),
                            ],
                          ),
                          style: TextStyle(fontSize: 16),
                          maxLines: 5,
                        ),

                        AutoSizeText.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Descrição: \n',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: _products.description),
                            ],
                          ),
                          style: TextStyle(fontSize: 16),
                          maxLines: 5,
                        ),
                        ButtonBar(
                          mainAxisSize: MainAxisSize
                              .min, // this will take space as minimum as posible(to center)
                          children: <Widget>[
                            ActionsButton(
                                onPressed: () => controller.excluir(_products),
                                icon: Icons.delete,
                                title: 'Excluir',
                                background: Colors.redAccent),
                            ActionsButton(
                                onPressed: () {
                                  controller.setFormUpdate(_products);
                                },
                                icon: Icons.edit,
                                title: 'Editar',
                                background: Colors.green),
                            ActionsButton(
                                onPressed: () {
                                  controller.changeStatus(_products);
                                },
                                icon: _products.status == ProductStatus.ATIVO
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                title: _products.status == ProductStatus.ATIVO
                                    ? 'Ativar'
                                    : 'Inativar',
                                background: Colors.orangeAccent),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          );
        });
  }
}
