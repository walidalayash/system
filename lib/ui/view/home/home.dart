import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:system/ui/view/task_page/task_page.dart';
import 'package:http/http.dart' as http;
import '../../shared/ui_helper.dart';
import '../empoloyees_info_page/empoloyees_info_page.dart';
import '../equipment_page/equipment_page.dart';
import '../material_page/material_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // String? _token;
  // FirebaseMessaging messaging = FirebaseMessaging.instance;

  // @override
  // void initState() {
  //   super.initState();
  //   messaging.getToken().then(
  //         (token) => _token = token,
  //       );
  // }

  // Future<bool> callOnFcmApiSendPushNotifications(
  //     {required String title, required String body}) async {
  //   const postUrl = 'https://fcm.googleapis.com/fcm/send';
  //   final data = {
  //     "to": _token,
  //     "notification": {
  //       "title": title,
  //       "body": body,
  //     },
  //     "data": {
  //       "type": '0rder',
  //       "id": '28',
  //       "click_action": 'FLUTTER_NOTIFICATION_CLICK',
  //     }
  //   };

  //   final headers = {
  //     'content-type': 'application/json',
  //     'Authorization':
  //         "key=AAAAhdu9r58:APA91bHEDp859GDUa5qHSKbnhlvPKeQQ4-DEz7Hj7c-hwrx8IFbhBhvz8R3Ih54cdxw20gYa-A8dYVdL07j6FDWr8BwhNQr4bbRczEdOJDla5687KcAzFkA4pAF155_UWD3YmnAohyZK"
  //   };

  //   final response = await http.post(Uri.parse(postUrl),
  //       body: json.encode(data),
  //       encoding: Encoding.getByName('utf-8'),
  //       headers: headers);

  //   if (response.statusCode == 200) {
  //     // on success do sth
  //     print('test ok push CFM');
  //     return true;
  //   } else {
  //     print(' CFM error');
  //     // on failure do sth
  //     return false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // FirebaseDatabase.instance
    //                                     .ref()
    //                                     .child('users')
    //                                     .orderByChild('email')
    //                                     .equalTo('widget.userEmail')
    //                                     .onChildAdded
    //                                     .listen((DatabaseEvent event) {
    //                                   FirebaseDatabase.instance
    //                                       .ref()
    //                                       .child('users')
    //                                       .child(
    //                                           event.snapshot.key.toString())
    //                                       .get()
    //                                     };
    return SafeArea(child: Scaffold(body: body(context)));
  }

  Widget body(context) {
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
                      fontSize: 16,
                      fontFamily: 'Karla2'),
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

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: <
        Widget>[
      UIHelper.verticalSpaceExtraLarge(),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
        InkWell(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(11)),
                    border: Border.all(
                      color: const Color.fromARGB(255, 233, 233, 233),
                    ),
                    color: const Color.fromARGB(255, 233, 233, 233),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/reports_icon.png")),
                ),
              ]),
              UIHelper.verticalSpaceMedium(),
              const Text(
                "تقارير",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Karla2'),
              )
            ],
          ),
          onTap: () => {textShow()},
        ),
        InkWell(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(11)),
                    border: Border.all(
                      color: const Color.fromARGB(255, 233, 233, 233),
                    ),
                    color: const Color.fromARGB(255, 233, 233, 233),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/task_icon.png")),
                ),
              ]),
              UIHelper.verticalSpaceMedium(),
              const Text(
                "المهام",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Karla2'),
              )
            ],
          ),
          onTap: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const TaskPage();
            }))
          },
        ),
        InkWell(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(11)),
                    border: Border.all(
                      color: const Color.fromARGB(255, 233, 233, 233),
                    ),
                    color: const Color.fromARGB(255, 233, 233, 233),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/time_icon.png")),
                ),
              ]),
              UIHelper.verticalSpaceMedium(),
              const Text(
                "تاريخ الإنجاز",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Karla2'),
              )
            ],
          ),
          onTap: () => textShow(),
        )
      ]),
      UIHelper.verticalSpaceLarge(),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
        InkWell(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(11)),
                    border: Border.all(
                      color: const Color.fromARGB(255, 233, 233, 233),
                    ),
                    color: const Color.fromARGB(255, 233, 233, 233),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/material_icon.png")),
                ),
              ]),
              UIHelper.verticalSpaceMedium(),
              const Text(
                "المواد",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Karla2'),
              )
            ],
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const MaterailPage();
            }));
          },
        ),
        InkWell(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(11)),
                    border: Border.all(
                      color: const Color.fromARGB(255, 233, 233, 233),
                    ),
                    color: const Color.fromARGB(255, 233, 233, 233),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/equipment_icon.png")),
                ),
              ]),
              UIHelper.verticalSpaceMedium(),
              const Text(
                "المعدات",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Karla2'),
              )
            ],
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const EquipmentPage();
            }));
          },
        ),
        InkWell(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(11)),
                    border: Border.all(
                      color: const Color.fromARGB(255, 233, 233, 233),
                    ),
                    color: const Color.fromARGB(255, 233, 233, 233),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/done_icon.png")),
                ),
              ]),
              UIHelper.verticalSpaceMedium(),
              const Text(
                "المنجز",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Karla2'),
              )
            ],
          ),
          onTap: () {
            textShow();
          },
        ),
      ]),
      UIHelper.verticalSpaceLarge(),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
        InkWell(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(11)),
                    border: Border.all(
                      color: const Color.fromARGB(255, 233, 233, 233),
                    ),
                    color: const Color.fromARGB(255, 233, 233, 233),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/statistics_icon.png")),
                ),
              ]),
              UIHelper.verticalSpaceMedium(),
              const Text(
                "الإحصائيات",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Karla2'),
              )
            ],
          ),
          onTap: () {
            textShow();
          },
        ),
        InkWell(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(11)),
                    border: Border.all(
                      color: const Color.fromARGB(255, 233, 233, 233),
                    ),
                    color: const Color.fromARGB(255, 233, 233, 233),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/employees_icon.png")),
                ),
              ]),
              UIHelper.verticalSpaceMedium(),
              const Text(
                "الموظفين",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Karla2'),
              )
            ],
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const EmpoloyeesInfoPage();
            }));
          },
        ),
        InkWell(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(11)),
                    border: Border.all(
                      color: const Color.fromARGB(255, 233, 233, 233),
                    ),
                    color: const Color.fromARGB(255, 233, 233, 233),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/fetch_photo.png")),
                ),
              ]),
              UIHelper.verticalSpaceMedium(),
              const Text(
                "الأستوديو",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Karla2'),
              )
            ],
          ),
          onTap: () {
            // callOnFcmApiSendPushNotifications(
            //   body: 'walid',
            //   title: 'd',
            // );
            textShow();
          },
        ),
      ])
    ]);
  }
}
