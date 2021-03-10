import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sistema_de_controle/app/modules/home/controller_page_store.dart';
import 'package:sistema_de_controle/app/widgets/page_tile.dart';

import 'custom_drawer_header.dart';

class PageSession extends StatelessWidget {
  final ControllerPageStore pageStore = GetIt.I<ControllerPageStore>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDrawerHeader(),
        Container(
          color: Color(0xffFFDD88),
          child: PageTile(
              label: 'Promoções',
              iconData: Icons.notifications_active,
              onTab: () {
                pageStore.setPage(0);
                Navigator.pop(context);
              },
              highlight: pageStore.page == 0),
        ),
        PageTile(
            label: 'Produtos',
            iconData: Icons.list,
            onTab: () {
              pageStore.setPage(2);
              Navigator.pop(context);
            },
            highlight: pageStore.page == 2),
        PageTile(
            label: 'Categorias',
            iconData: Icons.category,
            onTab: () {
              pageStore.setPage(1);
              Navigator.pop(context);
            },
            highlight: pageStore.page == 1),
        PageTile(
            label: 'Fornecedor',
            iconData: Icons.business,
            onTab: () {
              pageStore.setPage(7);
              Navigator.pop(context);
            },
            highlight: pageStore.page == 7),
        // PageTile(
        //     label: 'Clientes',
        //     iconData: Icons.person,
        //     onTab: () {
        //       pageStore.setPage(5);
        //       Navigator.pop(context);
        //     },
        //     highlight: pageStore.page == 5),
        // PageTile(
        //     label: 'Orçamentos',
        //     iconData: Icons.repeat,
        //     onTab: () {
        //       pageStore.setPage(3);
        //       Navigator.pop(context);
        //     },
        //     highlight: pageStore.page == 3),
        // PageTile(
        //     label: 'Vendas',
        //     iconData: Icons.monetization_on,
        //     onTab: () {
        //       pageStore.setPage(4);
        //       Navigator.pop(context);
        //     },
        //     highlight: pageStore.page == 4),

        // PageTile(
        //     label: 'Chat',
        //     iconData: Icons.chat,
        //     onTab: () {
        //       pageStore.setPage(6);
        //       Navigator.pop(context);
        //     },
        //     highlight: pageStore.page == 6),
      ],
    );
  }
}
