import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sistema_de_controle/app/modules/client/client_controller.dart';
import 'package:sistema_de_controle/app/modules/client/client_module.dart';

void main() {
  initModule(ClientModule());
  // ClientController client;
  //
  setUp(() {
    //     client = ClientModule.to.get<ClientController>();
  });

  group('ClientController Test', () {
    //   test("First Test", () {
    //     expect(client, isInstanceOf<ClientController>());
    //   });

    //   test("Set Value", () {
    //     expect(client.value, equals(0));
    //     client.increment();
    //     expect(client.value, equals(1));
    //   });
  });
}
