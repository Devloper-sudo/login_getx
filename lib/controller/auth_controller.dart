import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginexample/utils/app_route.dart';

class AuthController extends GetxController {
  GoogleSignIn googleSignIn;
  var isSign = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() async {
//
    googleSignIn = GoogleSignIn();
    ever(isSign, handleAuth);
    isSign.value = await firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isSign.value = event != null;
    });
    super.onInit();
  }

  @override
  void onClose() {
//
    super.onClose();
  }

  @override
  void onReady() {
//
    super.onReady();
  }

  handleAuth(bool callback) {
    Future.delayed(Duration(seconds: 2),(){
      if (callback) {
        Get.toNamed(RoutingNameConstants.DASHBOARD_SCREEN_ROUTE);
      } else {
        Get.toNamed(RoutingNameConstants.LOGIN_SCREEN_ROUTE);
      }
    });

  }
}
