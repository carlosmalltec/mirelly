import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sistema_de_controle/app/modules/models/provider_model.dart';
import 'package:sistema_de_controle/app/widgets/actions_button.dart';
import 'package:sistema_de_controle/app/widgets/item_not_found.dart';
import 'package:sistema_de_controle/app/widgets/loading_status.dart';
import 'package:sistema_de_controle/constants/colors.dart';
import 'package:sistema_de_controle/constants/drawables.dart';
import 'form_provider.dart';
import 'providers_controller.dart';
import 'shimmer/provider_shimmer.dart';

class ProvidersPage extends StatefulWidget {
  final String title;
  const ProvidersPage({Key key, this.title = "Providers"}) : super(key: key);

  @override
  _ProvidersPageState createState() => _ProvidersPageState();
}

class _ProvidersPageState
    extends ModularState<ProvidersPage, ProvidersController> with WidgetsBindingObserver {
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
                        controller.isFormEditProvider = false; //habilita mais campos
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
                controller.isExpandedProvider; //action for change expanded list
                if(controller.isChangeScreenProvider)
                  return Expanded(child: FormProviders(controller: controller));
                if ((controller.isLoading ==
                    LoadingStatus.notLoading) ||
                    (controller.isLoading ==
                        LoadingStatus.nextPageLoading)) {
                  if (controller.listDataProvider.length == 0) {
                    return Expanded(
                      child: ItemNotFound(
                        text: 'Fornecedor não localizado!',
                        icon: Drawables.notFound,
                      ),
                    );
                  } else {
                    return Expanded(
                        child: CupertinoScrollbar(child: _listProviders(_scroll)),
                    );
                  }
                } else {
                  if(controller.isLoading ==
                      LoadingStatus.shimmerLoading){
                    return Expanded(child: ProviderShimmer());
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

  ListView _listProviders(ScrollController scroll) {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: controller.listDataProvider.length,
        itemBuilder: (BuildContext context, int index) {
          var _providers = controller.listDataProvider[index];
          var _change = controller.isExpandedMapProvider[_providers.id];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ExpansionPanelList(
              key: ValueKey<String>(_providers.id),
              expansionCallback: (int index, bool isExpanded) {
                controller.isExpandedProvider = isExpanded;
                controller.changeIsExpanded(_providers.id, isExpanded);
              },
              children: [
                ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          leading: Icon(Icons.brightness_1,
                              color: _providers.status != ProviderStatus.ATIVO
                                  ? Colors.redAccent
                                  : Colors.green),
                          title: Text(
                            _providers.title ?? "",
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
                        Text(_providers.description ?? ""),
                        ButtonBar(
                          mainAxisSize: MainAxisSize
                              .min, // this will take space as minimum as posible(to center)
                          children: <Widget>[
                            ActionsButton(
                                onPressed: () => controller.excluir(_providers),
                                icon: Icons.delete,
                                title: 'Excluir',
                                background: Colors.redAccent),
                            ActionsButton(
                                onPressed: () {
                                  controller.setFormUpdate(_providers);
                                },
                                icon: Icons.edit,
                                title: 'Editar',
                                background: Colors.green),
                            ActionsButton(
                                onPressed: () {
                                  controller.changeStatus(_providers);
                                },
                                icon: _providers.status == ProviderStatus.ATIVO
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                title: _providers.status == ProviderStatus.ATIVO
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
