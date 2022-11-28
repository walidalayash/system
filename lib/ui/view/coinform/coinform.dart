import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../shared/ui_helper.dart';
import '../info_page/info_page.dart';
import '../root/root.dart';

class Coinform extends StatelessWidget {
  String verID;
  Coinform({super.key, required this.verID});
  final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> checkCode() async {
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
                    'الكود غير صحيح',
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

    Future<void> checkCode2() async {
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
                    'الرجاء ادخال الكود',
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

    Future<void> checkCode3() async {
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
                    'الكود صحيح',
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

    String userPhone = '';

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 73, 101, 58),
        title: const Center(
            child: Text(
          "تأكيد",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Karla',
              color: Colors.white),
        )),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 300),
              child: Text(
                'رسالة تأكيد',
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
                  color: const Color.fromARGB(255, 233, 233, 233),
                ),
                color: const Color.fromARGB(255, 233, 233, 233),
              ),
              child: TextField(
                controller: codeController,
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
            UIHelper.verticalSpaceExtraLarge(),
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2.0,
                  ),
                ],
              ),
              child: SizedBox(
                height: 50,
                width: 350,
                child: ElevatedButton(
                  onPressed: () async {
                    // Navigator.pop(context, codeController.text);
                    if (codeController.text == '') {
                      checkCode2();
                    } else {
                      try {
                        await FirebaseAuth.instance.signInWithCredential(
                          PhoneAuthProvider.credential(
                            verificationId: verID,
                            smsCode: codeController.text,
                          ),
                        );
                        checkCode3();
                        if (userPhone == '') {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => InfoPage()),
                            (Route<dynamic> route) => false,
                          );
                        } else {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Root()),
                            (Route<dynamic> route) => false,
                          );
                        }
                      } catch (error) {
                        checkCode();
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 73, 101, 58),
                  ),
                  child: const Text(
                    "تأكيد",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'Karla',
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ]),
    ));
  }
}
