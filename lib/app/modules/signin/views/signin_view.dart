import 'package:flash_chat_kurs12/app/constants/text_styles/app_text_styles.dart';
import 'package:flash_chat_kurs12/app/modules/signUp/views/sign_up_view.dart';
import 'package:flash_chat_kurs12/app/widgets/buttons/register_widget.dart';
import 'package:flash_chat_kurs12/app/widgets/text_fiallds/input_decoration_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends StatelessWidget {
  SigninView({Key? key}) : super(key: key);
  final _controller = Get.put<SigninController>(SigninController());
  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(
      height: 20,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUpView'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                sizedBox,
                TextField(
                  onChanged: (value) {
                    _controller.email.value = value;
                  },
                  decoration: registerDecoration.copyWith(
                      hintText: 'Email', prefixIcon: const Icon(Icons.email)),
                ),
                sizedBox,
                TextField(
                  onChanged: (value) {
                    _controller.password.value = value;
                  },
                  decoration: registerDecoration.copyWith(
                      hintText: 'Password', prefixIcon: const Icon(Icons.key)),
                ),
                Row(
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: AppTextStyles.black25,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () => Get.to(SignUpView()),
                      child: const Text(
                        'Sign Up',
                        style: AppTextStyles.black30Bold,
                      ),
                    ),
                  ],
                ),
                sizedBox,
                RegisterWidget(
                  text: 'Sign In',
                  onTap: () {
                    _controller.signIn();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
