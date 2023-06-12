import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_kurs12/app/modules/chat/views/chat_view.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  CollectionReference user = FirebaseFirestore.instance.collection('users');
  Future<void> addUserName() async {
    return user
        .add({
          'name': name.value,
          'email': email.value,
        })
        .then((value) => log('User Added'))
        .catchError((error) => log("Failed to add user: $error"));
  }

  Future<void> signUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.value,
            password: password.value,
          )
          .then((value) => {
                addUserName(),
                Get.to(ChatView()),
              });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.defaultDialog(title: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(title: 'The account already exists for that email.');
      }
    } catch (e) {
      Get.defaultDialog(title: 'error ==> $e');
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
