import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../models/equipment/equipment.dart';
import 'package:http/http.dart' as http;

class EquipmentPost with ChangeNotifier {
  List<Equipment> equipmentPost = [
    Equipment(
        idUser: 'user4321',
        idEquipment: 'ui22',
        department: 'it123',
        timeRequest: '2022/10/12',
        userName: 'أحمد',
        typeEquipment: 'شاحنة',
        typeRequest: 'إيجار',
        state: 'مستمر',
        photo: ""),
  ];
  //fetch Equipments post
  Future<void> fetchEquipments() async {
    const url =
        'https://system-33957-default-rtdb.firebaseio.com/equipments_post.json';
    equipmentPost.clear();
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((bagId, pbag) {
        equipmentPost.add(Equipment(
          idUser: pbag['idUser'],
          idEquipment: pbag['idEquipment'],
          department: pbag['department'],
          timeRequest: pbag['timeRequest'],
          userName: pbag['userName'],
          typeEquipment: pbag['typeEquipment'],
          typeRequest: pbag['typeRequest'],
          state: pbag['state'],
          photo: pbag['photo'],
        ));
      });
    } catch (error) {
      //  throw (error);
    }
  }

  // add Equipments post
  Future<void> addEquipmentsPost(idUser, department, timeRequest, userName,
      typeEquipment, typeRequest, state, photo) async {
    const url =
        'https://system-33957-default-rtdb.firebaseio.com/equipments_post.json';
    var uuid = const Uuid();
    var x = uuid.v1();
    try {
      http.post(
        Uri.parse(url),
        body: json.encode({
          'idUser': idUser,
          'idEquipment': x,
          'department': department,
          'timeRequest': timeRequest,
          "userName": userName,
          "typeEquipment": typeEquipment,
          "typeRequest": typeRequest,
          "state": state,
          "photo": photo,
        }),
      );
    } catch (error) {
      //   throw showAlert;
    }
  }
}
