import 'package:mobx/mobx.dart';

// Include generated file
part 'controller.g.dart';

// This is the class used by rest of your codebase
class Controller = ControllerBase with _$Controller;

// The store-class
abstract class ControllerBase with Store {
  ControllerBase();

  @observable
  int count = 0;

  @action
  void increment() {
    count++;
  }
}