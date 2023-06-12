import 'package:flash_chat_kurs12/app/modules/signUp/views/sign_up_view.dart';
import 'package:flash_chat_kurs12/app/modules/signin/views/signin_view.dart';
import 'package:flash_chat_kurs12/app/widgets/buttons/register_widget.dart';
import 'package:flash_chat_kurs12/app/widgets/text_fiallds/input_decoration_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/landing_controller.dart';

class LandingView extends GetView<LandingController> {
  const LandingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(
      height: 20,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('LandingView'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegisterWidget(
                  text: 'Sign In',
                  onTap: () {
                    Get.to(SigninView());
                  }),
              sizedBox,
              RegisterWidget(
                  text: 'Sign Up',
                  onTap: () {
                    Get.to(SignUpView());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
