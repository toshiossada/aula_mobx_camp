import 'home_store.dart';

class HomeController {
  final store = HomeStore();
  int get counter => store.counter.value;

  ///Incrementa contador
  void increment() {
    store.increment();
  }
}
