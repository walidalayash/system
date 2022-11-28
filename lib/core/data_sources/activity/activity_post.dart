import 'dart:convert';

import 'package:flutter/material.dart';

import '../../models/activity/activity.dart';
import 'package:http/http.dart' as http;

class ActivityPost with ChangeNotifier {
  List<Activity> activityPost = [
    Activity(
      idUser: '',
      department: '',
      timeRequest: 'a',
      userName: 'وليد',
      photo:
          'https://firebasestorage.googleapis.com/v0/b/system-33957.appspot.com/o/2021_11_14_14_8_25_348.jpg?alt=media&token=b64b63c2-3f92-4514-b8fb-63c5a85cf019',
      description: 'جديد النظام',
    )
  ];

  //fetch Activity
  Future<void> fetchActivity() async {
    const url =
        'https://system-33957-default-rtdb.firebaseio.com/activitys_post.json';

    try {
      final response = await http.get(
        Uri.parse(url),
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((bagId, pbag) {
        activityPost.add(Activity(
          idUser: pbag['idUser'],
          department: pbag['department'],
          timeRequest: pbag['timeRequest'],
          userName: pbag['userName'],
          photo: pbag['photo'],
          description: pbag['description'],
        ));
      });
    } catch (error) {
      //  throw (error);
    }
  }

  // add activity post
  Future<void> addactivityPost(
      idUser, timeRequest, department, userName, description, photo) async {
    const url =
        'https://system-33957-default-rtdb.firebaseio.com/activitys_post.json';

    try {
      http.post(
        Uri.parse(url),
        body: json.encode({
          'idUser': idUser,
          'timeRequest': timeRequest,
          'department': department,
          "userName": userName,
          'photo': photo,
          "description": description,
        }),
      );
    } catch (error) {
      //   throw showAlert;
    }
  }
}
