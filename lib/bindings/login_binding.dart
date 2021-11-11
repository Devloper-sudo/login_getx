import 'package:get/get.dart';
import 'package:loginexample/controller/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
   Get.put<LoginController>(LoginController(),permanent: true);
  }
  
  
}