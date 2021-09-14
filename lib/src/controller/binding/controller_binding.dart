import 'package:get/get.dart';
import 'package:tea_news/src/controller/binding/controller_dependency.dart';
import 'package:tea_news/src/controller/binding/data_source_dependency.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    bindingNewsController();
    bindingNewsDataSource();
  }
}
