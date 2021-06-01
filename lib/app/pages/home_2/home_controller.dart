import 'package:mobx/mobx.dart';

import 'home_store.dart';

class HomeController {
  final _store = HomeStore();
  int get counter => _store.counter;
  String get fullName => _store.fullName;
  List<String> get listNames => _store.listNames;
  String operator = '+';

  HomeController() {
    autorun((_) {
      print(counter);
    });

    when((_) {
      return counter != 0 && counter % 2 == 0;
    }, () {
      print('Número par');
    });

    reaction<bool>((_) {
      return counter % 6 == 0;
    }, (value) {
      if (value) print('Multiplo de 6');
    });

    initialNames();
  }

  Future<void> initialNames() async {
    await Future.delayed(Duration(seconds: 2));
    var listNames = List.generate(10, (index) => 'Name $index');
    _store.setListNames(listNames);
  }

  void increment() {
    if (operator == '+') {
      _store.increment();
    } else {
      _store.decrement();
    }

    if (counter == 10) {
      operator = '-';
    } else if (counter == 0) {
      operator = '+';
    }
  }

  void setFirstName(String value) {
    _store.setFirstName(value.trim());
  }

  void setLastName(String value) {
    _store.setLastName(value.trim());
  }

  void addName() {
    if (fullName.isNotEmpty) _store.addListNames(fullName);
    _store.clearNames();    
  }
}
