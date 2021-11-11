import 'package:flutter/material.dart';
import 'package:loginexample/utils/assets_utils.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(AssetsUtils.ASSETS_LOGO_ICON),
        ),
      ),
    );
  }
}
