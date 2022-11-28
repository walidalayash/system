import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system/ui/shared/ui_helper.dart';
import 'package:http/http.dart' as http;

import '../../../core/data_sources/offer/offers_post.dart';

class Cv extends StatefulWidget {
  final String name;
  final String phone;
  final String email;
  const Cv({
    Key? key,
    required this.name,
    required this.phone,
    required this.email,
  }) : super(key: key);

  @override
  State<Cv> createState() => _CvState();
}

class _CvState extends State<Cv> {
  //
  var file;

  UploadTask? uploadTask;

  var fileUrl;

  Future fetchfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        file = File(result.files.single.path.toString());
        uploadFile();
      });
    } else {
      // User canceled the picker
    }
  }

  Future uploadFile() async {
    if (file == null) return;
    final fileName = File(file!.path);
    //final destination = 'files/$fileName';

    final ref = FirebaseStorage.instance.ref().child('file/$fileName');

    uploadTask = ref.putFile(fileName);
    fileUrl = await (await uploadTask)?.ref.getDownloadURL();
    print(fileUrl.toString());
  }

//
  var file2;

  UploadTask? uploadTask2;

  var fileUrl2;

  Future fetchfile2() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        file2 = File(result.files.single.path.toString());
        uploadFile2();
      });
    } else {
      // User canceled the picker
    }
  }

  Future uploadFile2() async {
    if (file == null) return;
    final fileName = File(file!.path);
    //final destination = 'files/$fileName';

    final ref = FirebaseStorage.instance.ref().child('file/$fileName');

    uploadTask2 = ref.putFile(fileName);
    fileUrl2 = await (await uploadTask2)?.ref.getDownloadURL();
    print(fileUrl.toString());
  }

//
  var file3;

  UploadTask? uploadTask3;

  var fileUrl3;

  Future fetchfile3() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        file3 = File(result.files.single.path.toString());
        uploadFile3();
      });
    } else {
      // User canceled the picker
    }
  }

  Future uploadFile3() async {
    if (file == null) return;
    final fileName = File(file!.path);
    //final destination = 'files/$fileName';

    final ref = FirebaseStorage.instance.ref().child('file/$fileName');

    uploadTask3 = ref.putFile(fileName);
    fileUrl3 = await (await uploadTask2)?.ref.getDownloadURL();
    print(fileUrl.toString());
  }

  String? _token;
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    messaging.getToken().then(
          (token) => _token = token,
        );
  }

  Future<bool> callOnFcmApiSendPushNotifications(
      {required String title, required String body}) async {
    const postUrl = 'https://fcm.googleapis.com/fcm/send';
    final data = {
      "to": _token,
      "notification": {
        "title": title,
        "body": body,
      },
      "data": {
        "type": '0rder',
        "id": '28',
        "click_action": 'FLUTTER_NOTIFICATION_CLICK',
      }
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization':
          "key=AAAAhdu9r58:APA91bHEDp859GDUa5qHSKbnhlvPKeQQ4-DEz7Hj7c-hwrx8IFbhBhvz8R3Ih54cdxw20gYa-A8dYVdL07j6FDWr8BwhNQr4bbRczEdOJDla5687KcAzFkA4pAF155_UWD3YmnAohyZK"
    };

    final response = await http.post(Uri.parse(postUrl),
        body: json.encode(data),
        encoding: Encoding.getByName('utf-8'),
        headers: headers);

    if (response.statusCode == 200) {
      // on success do sth
      print('test ok push CFM');
      return true;
    } else {
      print(' CFM error');
      // on failure do sth
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 78, 84, 91),
          title: const Center(
              child: Text(
            "الملفات الخاصة بشركتك",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Karla'),
          ))),
      body: SingleChildScrollView(
          physics: const ScrollPhysics(), child: body(context)),
    );
  }

  Widget body(context) {
    return Column(children: [
      UIHelper.verticalSpaceExtraLarge(),
      InkWell(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.amber,
              boxShadow: [
                BoxShadow(
                  color: Colors.amber,
                  blurRadius: 2.0,
                ),
              ],
            ),
            child: const SizedBox(
              height: 50,
              width: 350,
              child: Center(child: Text('Upload CV')),
            ),
          ),
        ),
        onTap: () {
          fetchfile();
        },
      ),
      UIHelper.verticalSpaceMedium(),

      file == null
          ? const Text('لايوجد ملف',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'Karla2',
              ))
          : const Text('تمت إضافة ملف',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'Karla2',
              )),
      //
      UIHelper.verticalSpaceExtraLarge(),

      InkWell(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.amber,
              boxShadow: [
                BoxShadow(
                  color: Colors.amber,
                  blurRadius: 2.0,
                ),
              ],
            ),
            child: const SizedBox(
              height: 50,
              width: 350,
              child: Center(child: Text('Legal Doucement')),
            ),
          ),
        ),
        onTap: () {
          fetchfile2();
        },
      ),
      UIHelper.verticalSpaceMedium(),

      file2 == null
          ? const Text('لايوجد ملف',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'Karla2',
              ))
          : const Text('تمت إضافة ملف',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'Karla2',
              )),
      //
      UIHelper.verticalSpaceExtraLarge(),

      InkWell(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.amber,
              boxShadow: [
                BoxShadow(
                  color: Colors.amber,
                  blurRadius: 2.0,
                ),
              ],
            ),
            child: const SizedBox(
              height: 50,
              width: 350,
              child: Center(
                  child:
                      Text('Finincail Statment for last three years. if any')),
            ),
          ),
        ),
        onTap: () {
          fetchfile3();
        },
      ),
      UIHelper.verticalSpaceMedium(),
      file3 == null
          ? const Text('لايوجد ملف',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'Karla2',
              ))
          : const Text('تمت إضافة ملف',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'Karla2',
              )),
      //
      UIHelper.verticalSpaceExtraLarge(),

      Center(
        child: ElevatedButton(
          onPressed: () {
            Provider.of<OffersPost>(context, listen: false).addOffersPost(
              widget.name,
              widget.email,
              widget.phone,
            );
            callOnFcmApiSendPushNotifications(
              body: widget.phone,
              title: widget.name,
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: const Text(
            "إرسال",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: 'Karla2',
              color: Colors.white,
            ),
          ),
        ),
      )
    ]);
  }
}
