import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginexample/controller/auth_controller.dart';
import 'package:loginexample/utils/application_utils.dart';

class LoginController extends GetxController {
  User user;
  AuthController controller;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void loginViaGoogleSignIn() async {
    GoogleSignInAccount googleSignInAccount =
        await Get.find<AuthController>().googleSignIn.signIn();

    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      OAuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      ApplicationUtils.openDialog();
      UserCredential credential = await Get.find<AuthController>()
          .firebaseAuth
          .signInWithCredential(authCredential);
      user = credential.user;
      print("testing----${user.displayName}");
      ApplicationUtils.closeDialog();
    }
  }

  void logiViaFb() async {
    LoginResult result = await FacebookAuth.instance.login();
    switch (result.status) {
      case LoginStatus.success:
        final AuthCredential faceookCredential =
            FacebookAuthProvider.credential(result.accessToken.token);
        final userCred = await Get.find<AuthController>()
            .firebaseAuth
            .signInWithCredential(faceookCredential);
        user = userCred.user;

        break;
      case LoginStatus.failed:
        break;
      case LoginStatus.cancelled:
        // TODO: Handle this case.
        break;
      case LoginStatus.operationInProgress:
        // TODO: Handle this case.
        break;
    }
  }
}

class Resources {
  final Status status;

  Resources({this.status});
}

enum Status { Success, ERROR, Cancelled }
