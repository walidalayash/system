import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system/ui/shared/ui_helper.dart';

import '../../../core/data_sources/activity/activity_post.dart';
import '../../../core/data_sources/equipment/equipments_post.dart';
import '../../../core/data_sources/user/user.dart';

class AddEquipmentPage extends StatelessWidget {
  const AddEquipmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final timeRequestController = TextEditingController();
    final typeEquipmentController = TextEditingController();
    final typeRequestController = TextEditingController();
    final stateController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 73, 101, 58),
          leading: const BackButton(
            color: Colors.white, // <-- SEE HERE
          ),
          title: const Center(
              child: Text("إضافة معدات",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'Karla')))),
      body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                UIHelper.verticalSpaceLarge(),
                const Text('يوم الطلب',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla')),
                DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    items: <String>[
                      '2022/10/13',
                      '2022/10/14',
                      '2022/10/15',
                      '2022/10/16',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: '2022/10/13',
                    onChanged: (value) {
                      timeRequestController.text = value.toString();
                    }),
                UIHelper.verticalSpaceLarge(),
                const Text('اختيار المعدات',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla')),
                DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    items: <String>['شاحنة', 'كاشيك'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: 'شاحنة',
                    onChanged: (value) {
                      typeEquipmentController.text = value.toString();
                    }),
                UIHelper.verticalSpaceLarge(),
                const Text('نوع طلب ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla')),
                DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    items: <String>['إيجار', 'شراء'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: 'شراء',
                    onChanged: (value) {
                      typeRequestController.text = value.toString();
                    }),
                UIHelper.verticalSpaceLarge(),
                const Text(
                  'الحالة',
                  style: TextStyle(fontSize: 16, fontFamily: 'Karla'),
                ),
                DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    items: <String>[
                      'مستمرة',
                      'مكتملة',
                      'محذوفة',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: 'مستمرة',
                    onChanged: (value) {
                      stateController.text = value.toString();
                    }),
                UIHelper.verticalSpaceLarge(),
                Center(
                  child: Container(
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
                          Provider.of<EquipmentPost>(context, listen: false)
                              .addEquipmentsPost(
                                  'idUser',
                                  'الأي تي',
                                  timeRequestController.text,
                                  'وليد',
                                  typeEquipmentController.text,
                                  typeRequestController.text,
                                  stateController.text,
                                  'https://firebasestorage.googleapis.com/v0/b/system-33957.appspot.com/o/2021_11_14_14_8_25_348.jpg?alt=media&token=b64b63c2-3f92-4514-b8fb-63c5a85cf019');
                          //add activity
                          Provider.of<ActivityPost>(context, listen: false)
                              .addactivityPost(
                                  Provider.of<Users>(context, listen: false)
                                      .usersNow[0]
                                      .idUser,
                                  'Equipment',
                                  Provider.of<Users>(context, listen: false)
                                      .usersNow[0]
                                      .department,
                                  Provider.of<Users>(context, listen: false)
                                      .usersNow[0]
                                      .userName,
                                  typeEquipmentController.text,
                                  'https://firebasestorage.googleapis.com/v0/b/system-33957.appspot.com/o/2021_11_14_14_8_25_348.jpg?alt=media&token=b64b63c2-3f92-4514-b8fb-63c5a85cf019');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 73, 101, 58),
                        ),
                        child: const Text("تأكيد",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'Karla')),
                      ),
                    ),
                  ),
                )
              ])),
    );
  }
}
