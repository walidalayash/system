import 'package:flutter/material.dart';
import 'package:system/ui/shared/ui_helper.dart';

import 'commercial_information.dart';

class TechnicalInformation extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  const TechnicalInformation({
    Key? key,
    required this.name,
    required this.phone,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 78, 84, 91),
            title: const Center(
                child: Text(
              "معلومات تقنية",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'Karla'),
            ))),
        body: SingleChildScrollView(
            physics: const ScrollPhysics(), child: body(context)));
  }

  Widget body(context) {
    return Column(children: [
      UIHelper.verticalSpaceMedium(),
      const Padding(
        padding: EdgeInsets.only(left: 280),
        child: Text(
          'موجز للشركة',
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
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 233, 233, 233),
          ),
          color: const Color.fromARGB(255, 233, 233, 233),
        ),
        child: TextField(
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.multiline,
          minLines: 1, // <-- SEE HERE
          maxLines: 25, // <-
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: '',
            hintStyle: TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      //
      UIHelper.verticalSpaceMedium(),
      const Padding(
        padding: EdgeInsets.only(left: 280),
        child: Text(
          'خبرة سابقة في ليبيا',
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
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 233, 233, 233),
          ),
          color: const Color.fromARGB(255, 233, 233, 233),
        ),
        child: TextField(
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.multiline,
          minLines: 1, // <-- SEE HERE
          maxLines: 25, // <-
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: '',
            hintStyle: TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      //
      //
      UIHelper.verticalSpaceMedium(),
      const Padding(
        padding: EdgeInsets.only(left: 280),
        child: Text(
          'خبرة سابقة',
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
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 233, 233, 233),
          ),
          color: const Color.fromARGB(255, 233, 233, 233),
        ),
        child: TextField(
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.multiline,
          minLines: 1, // <-- SEE HERE
          maxLines: 25, // <-
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: '',
            hintStyle: TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      //
      //
      UIHelper.verticalSpaceMedium(),
      const Padding(
        padding: EdgeInsets.only(left: 280),
        child: Text(
          'سياسة إدارة الجودة',
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
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 233, 233, 233),
          ),
          color: const Color.fromARGB(255, 233, 233, 233),
        ),
        child: TextField(
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.multiline,
          minLines: 1, // <-- SEE HERE
          maxLines: 25, // <-
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: '',
            hintStyle: TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      //
      //
      UIHelper.verticalSpaceMedium(),
      const Padding(
        padding: EdgeInsets.only(left: 280),
        child: Text(
          'قدرات القوى العاملة',
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
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 233, 233, 233),
          ),
          color: const Color.fromARGB(255, 233, 233, 233),
        ),
        child: TextField(
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.multiline,
          minLines: 1, // <-- SEE HERE
          maxLines: 25, // <-
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: '',
            hintStyle: TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      //
      //
      UIHelper.verticalSpaceMedium(),
      const Padding(
        padding: EdgeInsets.only(left: 280),
        child: Text(
          'قدرات المعدات',
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
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 233, 233, 233),
          ),
          color: const Color.fromARGB(255, 233, 233, 233),
        ),
        child: TextField(
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.multiline,
          minLines: 1, // <-- SEE HERE
          maxLines: 25, // <-
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: '',
            hintStyle: TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      //
      UIHelper.verticalSpaceMedium(),
      const Padding(
        padding: EdgeInsets.only(left: 200),
        child: Text(
          'سياسة الصحة والسلامة والبيئة',
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
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 233, 233, 233),
          ),
          color: const Color.fromARGB(255, 233, 233, 233),
        ),
        child: TextField(
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.multiline,
          minLines: 1, // <-- SEE HERE
          maxLines: 25, // <-
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: '',
            hintStyle: TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      //
      //
      UIHelper.verticalSpaceMedium(),
      const Padding(
        padding: EdgeInsets.only(left: 300),
        child: Text(
          'التدريب',
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
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 233, 233, 233),
          ),
          color: const Color.fromARGB(255, 233, 233, 233),
        ),
        child: const TextField(
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.multiline,
          minLines: 1, // <-- SEE HERE
          maxLines: 25, // <-
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: '',
            hintStyle: TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      //
      UIHelper.verticalSpaceMedium(),

      ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CommercialInformation(
                name: name, phone: phone, email: email);
          }));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 78, 84, 91),
        ),
        child: const Text(
          "التالي",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: 'Karla2',
              color: Colors.white),
        ),
      )
    ]);
  }
}
