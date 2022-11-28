import 'package:flutter/material.dart';

import '../../shared/ui_helper.dart';
import '../add_material_page/add_material_page.dart';
import '../material_info_page/material_info_page.dart';

class MaterailPage extends StatelessWidget {
  const MaterailPage({super.key});

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
                    child: Text(
                  'المواد',
                  style: TextStyle(color: Colors.white, fontFamily: 'Karla'),
                ))),
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
                  Text(
                    'ملعومات المواد',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Karla2'),
                  )
                ]),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const MaterialInfokPage();
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
                  Text(
                    'اضفت مواد',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Karla2'),
                  )
                ]),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AddMaterialPage();
              }));
            },
          ),
        ]));
  }
}
