import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/data_sources/user/user.dart';
import '../../shared/ui_helper.dart';
import '../root/root.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();
    final emailController = TextEditingController();
    final placeController = TextEditingController();
    final departmentController = TextEditingController();
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 73, 101, 58),
              leading: const BackButton(
                color: Colors.white, // <-- SEE HERE
              ),
              title: const Center(
                  child: Text(
                "معلومات الأساسية",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Karla',
                    color: Colors.white),
              )),
            ),
            body: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    UIHelper.verticalSpaceExtraLarge(),
                    UIHelper.verticalSpaceExtraLarge(),
                    const Padding(
                      padding: EdgeInsets.only(left: 300),
                      child: Text(
                        'الأسم',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Karla2',
                            color: Colors.black),
                      ),
                    ),
                    UIHelper.verticalSpaceMedium(),
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
                        controller: userNameController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.person),
                            color: Colors.grey,
                          ),
                          hintText: 'الأسم',
                          hintStyle: const TextStyle(color: Colors.black),
                        ),
                        style: const TextStyle(color: Colors.black),
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
                      padding: EdgeInsets.only(left: 300),
                      child: Text(
                        'موقع العمل',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Karla2',
                            color: Colors.black),
                      ),
                    ),
                    UIHelper.verticalSpaceMedium(),
                    DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        items:
                            <String>['بنغازي', 'البريقة'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: 'بنغازي',
                        onChanged: (value) {
                          placeController.text = value.toString();
                        }),
                    UIHelper.verticalSpaceLarge(),
                    const Padding(
                      padding: EdgeInsets.only(left: 300),
                      child: Text(
                        'القسم',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Karla2',
                            color: Colors.black),
                      ),
                    ),
                    UIHelper.verticalSpaceMedium(),
                    DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        items: <String>['صيانة', 'الدعم'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: 'صيانة',
                        onChanged: (value) {
                          departmentController.text = value.toString();
                        }),
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
                          onPressed: () {
                            final phone =
                                FirebaseAuth.instance.currentUser?.phoneNumber;

                            Provider.of<Users>(context, listen: false).addUsers(
                                userNameController.text,
                                phone.toString(),
                                emailController,
                                departmentController,
                                placeController.text);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Root()),
                              (Route<dynamic> route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 73, 101, 58),
                          ),
                          child: const Text(
                            "تأكيد",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Karla2',
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ]),
            )));
  }
}
