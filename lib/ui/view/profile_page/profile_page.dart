import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system/ui/shared/ui_helper.dart';
import 'package:system/ui/view/login/login.dart';

import '../../../core/data_sources/user/user.dart';
import '../contractors/contractors.dart';
import '../offer/offer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          physics: const ScrollPhysics(), child: body(context)),
    ));
  }

  Widget body(context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Future<void> textShow() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'قريبا',
              style: TextStyle(fontFamily: "HS"),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                    'غير متاح الأن',
                    style: TextStyle(fontFamily: "HS"),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'موافق',
                  style: TextStyle(
                      color: Color.fromARGB(255, 65, 102, 52),
                      fontFamily: "HS"),
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

    return Column(children: <Widget>[
      UIHelper.verticalSpaceExtraLarge(),

      Stack(
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: 200,
              width: 315,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(11)),
                border: Border.all(
                  color: const Color.fromARGB(255, 233, 233, 233),
                ),
                color: const Color.fromARGB(255, 251, 251, 251),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 211, 211, 211),
                    blurRadius: 2.0,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset('assets/person.png')),
                UIHelper.verticalSpaceMedium(),
                Text(
                    Provider.of<Users>(context, listen: false)
                        .usersNow[0]
                        .userName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150, top: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('رقم الهاتف',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla')),
                Text(
                    Provider.of<Users>(context, listen: false)
                        .usersNow[0]
                        .phone,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla2')),
                const Text('البريد الألكتروني',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla')),
                Text(
                    Provider.of<Users>(context, listen: false)
                        .usersNow[0]
                        .email,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla2'))
              ],
            ),
          ),
        ],
      ),

      UIHelper.verticalSpaceLarge(),
      InkWell(
        child: Stack(
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                margin: const EdgeInsets.only(left: 10, right: 10),
                height: 55,
                width: 315,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(11)),
                  border: Border.all(
                    color: const Color.fromARGB(255, 233, 233, 233),
                  ),
                  color: const Color.fromARGB(255, 251, 251, 251),
                ),
              ),
            ),
            Row(children: const [
              Padding(
                padding: EdgeInsets.only(left: 50, top: 15),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 15.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 140, top: 20),
                child: Text("تعديل الملف الشخصي",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla2')),
              ),
            ]),
          ],
        ),
        onTap: () {
          textShow();
        },
      ),
      //
      UIHelper.verticalSpaceLarge(),

      InkWell(
        child: Stack(
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                margin: const EdgeInsets.only(left: 10, right: 10),
                height: 55,
                width: 315,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(11)),
                  border: Border.all(
                    color: const Color.fromARGB(255, 233, 233, 233),
                  ),
                  color: const Color.fromARGB(255, 251, 251, 251),
                ),
              ),
            ),
            Row(children: const [
              Padding(
                padding: EdgeInsets.only(left: 50, top: 15),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 15.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 220, top: 20),
                child: Text("المقاولون",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla2')),
              ),
            ]),
          ],
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Contractors();
          }));
        },
      ),
      //
      UIHelper.verticalSpaceLarge(),

      InkWell(
        child: Stack(
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                margin: const EdgeInsets.only(left: 10, right: 10),
                height: 55,
                width: 315,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(11)),
                  border: Border.all(
                    color: const Color.fromARGB(255, 233, 233, 233),
                  ),
                  color: const Color.fromARGB(255, 251, 251, 251),
                ),
              ),
            ),
            Row(children: const [
              Padding(
                padding: EdgeInsets.only(left: 50, top: 15),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 15.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 220, top: 20),
                child: Text("العروض",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla2')),
              ),
            ]),
          ],
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Offer();
          }));
        },
      ),
      //
      UIHelper.verticalSpaceLarge(),
      InkWell(
        child: Stack(
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                margin: const EdgeInsets.only(left: 10, right: 10),
                height: 55,
                width: 315,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(11)),
                  border: Border.all(
                    color: const Color.fromARGB(255, 233, 233, 233),
                  ),
                  color: const Color.fromARGB(255, 251, 251, 251),
                ),
              ),
            ),
            Row(children: const [
              Padding(
                padding: EdgeInsets.only(left: 50, top: 15),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 15.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 180, top: 15),
                child: Text("معلومات القسم",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla2')),
              ),
            ]),
          ],
        ),
        onTap: () {
          textShow();
        },
      ),
      //
      UIHelper.verticalSpaceLarge(),
      InkWell(
        child: Stack(
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                margin: const EdgeInsets.only(left: 10, right: 10),
                height: 55,
                width: 315,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(11)),
                  border: Border.all(
                    color: const Color.fromARGB(255, 233, 233, 233),
                  ),
                  color: const Color.fromARGB(255, 251, 251, 251),
                ),
              ),
            ),
            Row(children: const [
              Padding(
                padding: EdgeInsets.only(left: 50, top: 15),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 15.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 220, top: 15),
                child: Text("إشعارات",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla2')),
              ),
            ]),
          ],
        ),
        onTap: () {
          textShow();
        },
      ),
      //
      UIHelper.verticalSpaceLarge(),

      InkWell(
        child: Stack(
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                margin: const EdgeInsets.only(left: 10, right: 10),
                height: 55,
                width: 315,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(11)),
                  border: Border.all(
                    color: const Color.fromARGB(255, 233, 233, 233),
                  ),
                  color: const Color.fromARGB(255, 251, 251, 251),
                ),
              ),
            ),
            Row(children: const [
              Padding(
                padding: EdgeInsets.only(left: 50, top: 15),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 15.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 190, top: 20),
                child: Text('تسجيل الخروج',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla2')),
              ),
            ]),
          ],
        ),
        onTap: () {
          FirebaseAuth.instance.signOut();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
            (Route<dynamic> route) => false,
          );
        },
      ),
      UIHelper.verticalSpaceLarge(),
    ]);
  }
}
