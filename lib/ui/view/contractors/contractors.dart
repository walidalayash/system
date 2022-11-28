import 'package:flutter/material.dart';
import 'package:system/ui/shared/ui_helper.dart';
import 'package:system/ui/view/contractors/technical_information.dart';

class Contractors extends StatefulWidget {
  const Contractors({super.key});

  @override
  State<Contractors> createState() => _ContractorsState();
}

class _ContractorsState extends State<Contractors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 78, 84, 91),
          title: const Center(
              child: Text(
            "معلومات المقاول",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Karla'),
          ))),
      body:
          SingleChildScrollView(physics: const ScrollPhysics(), child: body()),
    );
  }

  Widget body() {
    final companyNameController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();
    return Column(children: [
      UIHelper.verticalSpaceLarge(),

      const Padding(
        padding: EdgeInsets.only(left: 280),
        child: Text(
          'أسم الشركة',
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
          controller: companyNameController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '',
            hintStyle: const TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      UIHelper.verticalSpaceLarge(),
      //
      const Padding(
        padding: EdgeInsets.only(left: 280),
        child: Text(
          'جنسية',
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
          //   controller: companyNameController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '',
            hintStyle: const TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      //
      UIHelper.verticalSpaceLarge(),

      const Padding(
        padding: EdgeInsets.only(left: 280),
        child: Text(
          'سنة التأسيس',
          style: TextStyle(fontSize: 14, color: Colors.black),
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
          //   controller: companyNameController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '',
            hintStyle: const TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      //
      //
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
            hintText: '',
            hintStyle: const TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      //
      //
      UIHelper.verticalSpaceLarge(),

      const Padding(
        padding: EdgeInsets.only(left: 280),
        child: Text(
          'رقم الهاتف',
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
          controller: phoneController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '',
            hintStyle: const TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      //
      //
      UIHelper.verticalSpaceLarge(),

      const Padding(
        padding: EdgeInsets.only(left: 200),
        child: Text(
          'بيانات تواصل الشخص و التفاصيل',
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
          //  controller: companyNameController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '',
            hintStyle: const TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      //
      UIHelper.verticalSpaceLarge(),

      const Text(
        'أنشطة',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            fontFamily: 'Karla2',
            color: Colors.black),
      ),
      UIHelper.verticalSpaceLarge(),
      DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintStyle: const TextStyle(fontSize: 14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          items: <String>[
            'EPC',
            'Procurement Services',
            'Training Services',
            'Testing & Inspection',
            'Engineering Services',
            'Manpower Provider',
            'supplier',
            'Project Management',
            'Heavy Equipment Rental',
            'Construction',
            'other type'
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          value: 'EPC',
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
          //   controller: companyNameController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '',
            hintStyle: const TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      UIHelper.verticalSpaceLarge(),

      ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TechnicalInformation(
                name: companyNameController.text,
                phone: phoneController.text,
                email: emailController.text);
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
      ),
    ]);
  }
}
