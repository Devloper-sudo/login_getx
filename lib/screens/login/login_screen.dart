import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginexample/controller/login_controller.dart';
import 'package:loginexample/utils/assets_utils.dart';
import 'package:loginexample/utils/font_family.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          "Welcome Back!",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: FontFamily.REGULAR,
                              fontSize: 18),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          "Let's login for explore continues",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: FontFamily.REGULAR,
                              fontSize: 14),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              AssetsUtils.ASSETS_LOGO_ICON,
                              height: 50,
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: RichText(
                          text: TextSpan(
                              text: "App",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: FontFamily.REGULAR,
                                  fontSize: 17),
                              children: [
                                TextSpan(
                                    text: " Developer",
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent,
                                        fontFamily: FontFamily.REGULAR,
                                        fontSize: 17))
                              ]),
                        )),
                    _buildHeader("Email or Phone Number"),
                    _buildTextFormField("Enter Email or Phone Number",
                        AssetsUtils.ASSETS_EMAIL_ICON),
                    _buildHeader("Passowrd"),
                    _buildTextFormField(
                        "Enter Password", AssetsUtils.ASSETS_PASSWORD_ICON),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          "You can also Connect with",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: FontFamily.REGULAR,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    _buildSocialButton(),
                    Center(
                      child: RichText(
                        text: TextSpan(
                            text: "Don't have and account",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: FontFamily.REGULAR,
                                fontSize: 14),
                            children: [
                              TextSpan(
                                  text: " Sign up here,",
                                  style: TextStyle(
                                      color: Colors.deepOrangeAccent,
                                      fontFamily: FontFamily.REGULAR,
                                      fontSize: 14))
                            ]),
                      ),
                    )
                  ],
                ),
                margin: const EdgeInsets.only(top: 70, left: 10, right: 10),
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildSocialButton() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                Get.find<LoginController>().logiViaFb();

              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: const [BoxShadow(color: Colors.black)],
                    image: DecorationImage(
                        image: AssetImage(AssetsUtils.ASSETS_FB_ICON))),
              )),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
              onTap: () {

                Get.find<LoginController>().loginViaGoogleSignIn();

              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: const [BoxShadow(color: Colors.black)],
                    image: DecorationImage(
                        image: AssetImage(AssetsUtils.ASSETS_GOOGLE_ICON))),
              ))
        ],
      ),
    );
  }

  Padding _buildTextFormField(hnt, assets) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Container(
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: TextFormField(
              controller: TextEditingController(),
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: FontFamily.REGULAR,
                  fontSize: 14),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: SizedBox(
                          height: 10,
                          width: 40,
                          child: Image.asset(
                            assets,
                            height: 10,
                            color: Colors.red,
                          ))),
                  contentPadding:
                      const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                  border: InputBorder.none,
                  isDense: false,
                  labelText: hnt,
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: FontFamily.REGULAR,
                      fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black, width: 1.0))),
            )));
  }

  Padding _buildHeader(text) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontFamily: FontFamily.REGULAR, fontSize: 14),
      ),
    );
  }
}
