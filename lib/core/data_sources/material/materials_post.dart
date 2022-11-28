import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import '../../models/material/material.dart';

class MaterialsPost with ChangeNotifier {
  List<MaterialCompany> materialsPost = [
    MaterialCompany(
      idUser: '1ws33',
      idMaterial: 'www',
      department: 'itr23',
      userName: 'عماد',
      description: 'المزيد من الأنابيب',
      material: 'انابيب',
      quantity: '50',
      photo: 'sasasasas',
      state: 'مستمر',
    ),
  ];
  //fetch Materials
  Future<void> fetchMaterials() async {
    const url =
        'https://system-33957-default-rtdb.firebaseio.com/materials_post.json';
    materialsPost.clear();
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((bagId, pbag) {
        materialsPost.add(MaterialCompany(
          idUser: pbag['idUser'],
          idMaterial: pbag['idMaterial'],
          department: pbag['department'],
          userName: pbag['userName'],
          description: pbag['description'],
          material: pbag['material'],
          quantity: pbag['quantity'],
          photo: pbag['photo'],
          state: pbag['state'],
        ));
      });
    } catch (error) {
      //  throw (error);
    }
  }

  // add Materials post
  Future<void> addMaterialsPost(
    idUser,
    department,
    userName,
    description,
    photo,
    state,
    material,
    quantity,
  ) async {
    const url =
        'https://system-33957-default-rtdb.firebaseio.com/materials_post.json';
    var uuid = const Uuid();
    var x = uuid.v1();
    try {
      http.post(
        Uri.parse(url),
        body: json.encode({
          'idUser': idUser,
          'idMaterial': x,
          'department': department,
          "userName": userName,
          "description": description,
          "photo": photo,
          "state": state,
          "material": material,
          "quantity": quantity,
        }),
      );
    } catch (error) {
      //   throw showAlert;
    }
  }
}
