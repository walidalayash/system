import 'package:flutter/material.dart';

import '../../shared/ui_helper.dart';
import '../add_equipment_page/add_equipment_page.dart';
import '../equipment_info_page/equipment_info_page.dart';

class EquipmentPage extends StatelessWidget {
  const EquipmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 73, 101, 58),
                leading: const BackButton(
                  color: Colors.white, // <-- SEE HERE
                ),
                title: const Center(
                    child: Text('المعدات',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Karla')))),
            body: body(context)));
  }

  Widget body(context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(children: <Widget>[
          SizedBox(
              height: 300,
              width: width,
              child: Image.asset('assets/background.png')),
          const Divider(),
          UIHelper.verticalSpaceLarge(),
          InkWell(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Icon(
                    Icons.task,
                    color: Colors.black,
                    size: 20.0,
                  ),
                  Text('ملعومات المعدات',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Karla2')),
                ]),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const EquipmentInfokPage();
              }));
            },
          ),
          UIHelper.verticalSpaceLarge(),
          const Divider(),
          UIHelper.verticalSpaceLarge(),
          InkWell(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 20.0,
                  ),
                  Text('اضفت معدات',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Karla2')),
                ]),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AddEquipmentPage();
              }));
            },
          ),
        ]));
  }
}
