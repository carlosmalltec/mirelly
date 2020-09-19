import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sistema_de_controle/app/modules/category/shimmer/category_shimmer.dart';
import 'package:sistema_de_controle/app/modules/models/category.dart';
import 'package:sistema_de_controle/app/widgets/actions_button.dart';
import 'package:sistema_de_controle/app/widgets/item_not_found.dart';
import 'package:sistema_de_controle/app/widgets/loading_status.dart';
import 'package:sistema_de_controle/constants/colors.dart';
import 'package:sistema_de_controle/constants/drawables.dart';
import 'category_controller.dart';
import 'form_category.dart';

class CategoryPage extends StatefulWidget {
  final String title;
  const CategoryPage({Key key, this.title = "Categorias"}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends ModularState<CategoryPage, CategoryController>
    with WidgetsBindingObserver {
  final ScrollController _scroll = ScrollController();

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
      onRefresh: ()=>controller.swipeRefresh(),
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
                        controller.isFormEdit = false; //habilita mais campos
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
                controller.isExpanded; //action for change expanded list
                if(controller.isChangeScreen)
                  return Expanded(child: FormCategory(controller: controller));
                print(controller.isLoading);
                if ((controller.isLoading ==
                    LoadingStatus.notLoading) ||
                    (controller.isLoading ==
                        LoadingStatus.nextPageLoading)) {
                  if (controller.listData.length == 0) {
                    return Expanded(
                      child: ItemNotFound(
                        text: 'Categorias não localizadas!',
                        icon: Drawables.notFound,
                      ),
                    );
                  } else {
                    return Expanded(
                        child: CupertinoScrollbar(child: _listCategory(_scroll)),
                    );
                  }
                } else {
                  if(controller.isLoading ==
                      LoadingStatus.shimmerLoading){
                    return Expanded(child: CategoryShimmer());
                  }else {
                    return Expanded(
                      child: Container(
                          child: CupertinoActivityIndicator()),
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

  ListView _listCategory(ScrollController scroll) {
    return ListView.builder(
//        controller: scroll,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: controller.listData.length,
        itemBuilder: (BuildContext context, int index) {
          var _cate = controller.listData[index];
          var _change = controller.isExpandedMap[_cate.id];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ExpansionPanelList(
              key: ValueKey<String>(_cate.id),
              expansionCallback: (int index, bool isExpanded) {
                controller.isExpanded = isExpanded;
                controller.changeIsExpanded(_cate.id, isExpanded);
              },
              children: [
                ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          leading: Icon(Icons.brightness_1,
                              color: _cate.status != CategoryStatus.ATIVO
                                  ? Colors.redAccent
                                  : Colors.green),
                          title: Text(
                            _cate.title ?? "",
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ));
                    },
                    isExpanded: _change ?? false,
                    body: Column(
                      children: [
                        Text(_cate.description ?? ""),
                        ButtonBar(
                          mainAxisSize: MainAxisSize
                              .min, // this will take space as minimum as posible(to center)
                          children: <Widget>[
                            ActionsButton(
                                onPressed: () => controller.excluir(_cate),
                                icon: Icons.delete,
                                title: 'Excluir',
                                background: Colors.redAccent),
                            ActionsButton(
                                onPressed: () {
                                  controller.setFormUpdate(_cate);
                                },
                                icon: Icons.edit,
                                title: 'Editar',
                                background: Colors.green),
                            ActionsButton(
                                onPressed: () {
                                  controller.changeStatus(_cate);
                                },
                                icon: _cate.status == CategoryStatus.ATIVO
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                title: _cate.status == CategoryStatus.ATIVO
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
