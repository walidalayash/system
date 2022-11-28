import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:system/ui/view/contractors/cv.dart';

import '../../shared/ui_helper.dart';

class CommercialInformation extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  const CommercialInformation({
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
            "المعلومات التجارية",
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
      UIHelper.verticalSpaceLarge(),
      Text(
        'نوع الشركة',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            fontFamily: 'Karla2',
            color: Colors.black),
      ),

      DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintStyle: const TextStyle(fontSize: 14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          items: <String>[
            'Government owned company',
            'Subsidiary Company',
            'Corporation',
            'Limited Liability Company',
            'Subsidiary Company',
            'Joint Venture',
            'Joint Venture',
            'other type'
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          value: 'Government owned company',
          onChanged: (value) {
            //  materialController.text = value.toString();
          }),
      UIHelper.verticalSpaceLarge(),
      const Text(
        'إذا كان شي آخر الرجاء كتبتها هنا',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            fontFamily: 'Karla2',
            color: Colors.black),
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
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.search,
          //    controller: companyNameController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '',
            hintStyle: const TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      UIHelper.verticalSpaceLarge(),
      const Text(
        'رأس مال الشركة',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            fontFamily: 'Karla2',
            color: Colors.black),
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
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.search,
          //    controller: companyNameController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '',
            hintStyle: const TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      UIHelper.verticalSpaceLarge(),
      const Text(
        'parent oranzation ..if any',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'Karla2',
            color: Colors.black),
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
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.search,
          //    controller: companyNameController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '',
            hintStyle: const TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      UIHelper.verticalSpaceLarge(),
      Text(
        'Representative or Branch Office in Libya?',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'Karla2',
            color: Colors.black),
      ),
      DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintStyle: const TextStyle(fontSize: 14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          items: <String>[
            'Yes',
            'No',
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          value: 'Yes',
          onChanged: (value) {
            //  materialController.text = value.toString();
          }),
      //
      UIHelper.verticalSpaceLarge(),
      Text(
        'Representative/Branch Details',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            fontFamily: 'Karla2',
            color: Colors.black),
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
      //
      UIHelper.verticalSpaceLarge(),
      Text(
        'CSR Policy',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            fontFamily: 'Karla2',
            color: Colors.black),
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
      ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Cv(name: name, phone: phone, email: email);
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
