import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../shared/ui_helper.dart';
import '../coinform/coinform.dart';
import '../login/login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    String verify = '';
    String ver = '';
    final phoneController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final passwordCoinformController = TextEditingController();
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'تحذير',
              style: TextStyle(fontFamily: "HS"),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                    'الرجاء ادخال رقم الهاتف',
                    style: TextStyle(fontFamily: "HS"),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'موافق',
                  style: TextStyle(color: Colors.red, fontFamily: "HS"),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    void showSnackBarText(String text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
    }

    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(children: <Widget>[
                  UIHelper.verticalSpaceExtraLarge(),
                  UIHelper.verticalSpaceExtraLarge(),
                  UIHelper.verticalSpaceExtraLarge(),
                  UIHelper.verticalSpaceExtraLarge(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: const Text(
                        'تسجيل',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            fontFamily: 'Karla2',
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: const Text(
                          'أنشئ حسابك',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: 'Karla2',
                              color: Colors.grey),
                        )),
                  ),
                  UIHelper.verticalSpaceExtraLarge(),
                  const Padding(
                    padding: EdgeInsets.only(left: 300),
                    child: Text(
                      'رقم هاتفك',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Karla2',
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 224, 224, 224),
                      ),
                      color: const Color.fromARGB(255, 224, 224, 224),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "+218|",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: 'Karla2',
                              color: Colors.black),
                        ),
                        UIHelper.verticalSpaceSmall(),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.search,
                            controller: phoneController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.phone),
                                color: Colors.grey,
                              ),
                              hintText: '',
                              hintStyle: const TextStyle(color: Colors.black),
                            ),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  UIHelper.verticalSpaceLarge(),
                  const Padding(
                    padding: EdgeInsets.only(left: 280),
                    child: Text(
                      'البريد الألكتروني',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Karla2',
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 224, 224, 224),
                      ),
                      color: const Color.fromARGB(255, 224, 224, 224),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.search,
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.email_outlined),
                          color: Colors.grey,
                        ),
                        hintText: '',
                        hintStyle: const TextStyle(color: Colors.black),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  UIHelper.verticalSpaceLarge(),
                  const Padding(
                    padding: EdgeInsets.only(left: 280),
                    child: Text(
                      'رمز السري',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Karla2',
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 224, 224, 224),
                      ),
                      color: const Color.fromARGB(255, 224, 224, 224),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.search,
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.password),
                          color: Colors.grey,
                        ),
                        hintText: '',
                        hintStyle: const TextStyle(color: Colors.black),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  UIHelper.verticalSpaceLarge(),
                  const Padding(
                    padding: EdgeInsets.only(left: 270),
                    child: Text(
                      'تأكيد رمز السري',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Karla2',
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 224, 224, 224),
                      ),
                      color: const Color.fromARGB(255, 224, 224, 224),
                    ),
                    child: TextField(
                      controller: passwordCoinformController,
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.password),
                          color: Colors.grey,
                        ),
                        hintText: '',
                        hintStyle: const TextStyle(color: Colors.black),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  UIHelper.verticalSpaceLarge(),
                  UIHelper.verticalSpaceLarge(),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Login();
                        }));
                      },
                      child: const Text(
                        'لدي حساب',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Karla',
                            color: Colors.black),
                      )),
                  UIHelper.verticalSpaceMedium(),
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 211, 211, 211),
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                    child: SizedBox(
                      height: 50,
                      width: 350,
                      child: ElevatedButton(
                        onPressed: () async {
                          //   Navigator.push(context,
                          //       MaterialPageRoute(builder: (context) {
                          //     return const Coinform();
                          //   }));
                          if (phoneController.text == '') {
                            _showMyDialog();
                          } else {
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: "+218${phoneController.text}",
                              timeout: const Duration(seconds: 20),
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {
                                showSnackBarText("Auth Completed!");
                              },
                              verificationFailed: (FirebaseAuthException e) {
                                showSnackBarText("Auth Failed!");
                              },
                              codeSent:
                                  (String verificationId, int? resendToken) {
                                showSnackBarText("OTP Sent!");
                                ver = verificationId;
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Coinform(verID: ver);
                                }));
                                // setState(() {
                                //   screenState = 1;
                                // });
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {
                                showSnackBarText("Timeout!");
                              },
                            );
                          }
                          // FirebaseAuth auth = FirebaseAuth.instance;

                          // await auth.verifyPhoneNumber(
                          //   phoneNumber: '+218${phoneController.text}',
                          //   codeSent: (String verificationId,
                          //       int? resendToken) async {
                          //     // // Update the UI - wait for the user to enter the SMS code
                          //     // String smsCode = 'xxxx';
                          //     final result = await Navigator.push(context,
                          //         MaterialPageRoute(builder: (context) {
                          //       return Coinform();
                          //     }));
                          //     //    Create a PhoneAuthCredential with the code

                          //     PhoneAuthCredential credential =
                          //         PhoneAuthProvider.credential(
                          //             verificationId: verificationId,
                          //             smsCode: result);
                          // print("--------");
                          // print(credential.smsCode);
                          // print("///////////");
                          // print(credential.smsCode);

                          // Sign the user in (or link) with the credential
                          // await auth.signInWithCredential(credential);
                          // verificationCompleted:
                          // (PhoneAuthCredential credential) {};
                          // verificationFailed:
                          // (FirebaseAuthException e) {};
                          // codeSent:
                          // (String verificationId, int? resendToken) {};
                          // codeAutoRetrievalTimeout:
                          // (String verificationId) {};
                          //   },
                          //   verificationFailed:
                          //       (FirebaseAuthException error) {},
                          //   codeAutoRetrievalTimeout:
                          //       (String verificationId) {},
                          //   verificationCompleted:
                          //       (PhoneAuthCredential phoneAuthCredential) {},
                          // );
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 65, 102, 52),
                        ),
                        child: const Text(
                          "تسجيل",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              fontFamily: 'Karla2',
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  UIHelper.verticalSpaceMedium()
                ]))));
  }
}
