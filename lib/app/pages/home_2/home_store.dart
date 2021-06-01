import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  ObservableList<String> listNames = <String>[].asObservable();

  @observable
  String firstName = '';
  @observable
  String lastName = '';
  @computed
  String get fullName => '$firstName $lastName'.trim();

  @observable
  int counter = 0;

  @action
  void increment() {
    counter++;
  }

  @action
  void decrement() {
    counter--;
  }

  @action
  void setFirstName(String value) {
    firstName = value;
  }

  @action
  void setLastName(String value) {
    lastName = value;
  }

  @action
  void clearNames() {
    lastName = '';
    firstName = '';
  }

  @action
  void setListNames(List<String> value) {
    listNames = value.asObservable();
  }

  @action
  void addListNames(String value) {
    listNames.add(value);
  }
}
