import 'package:flutter_dev_test/src/modules/recover/recover_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecoverModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const RecoverPage());
  }
}
