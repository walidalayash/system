import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../models/task/task.dart';
import 'package:http/http.dart' as http;

class TasksPost with ChangeNotifier {
  List<Task> tasksPost = [
    // Task(
    //     idUser: '12345678',
    //     idTask: "sds2wd",
    //     department: 'it312',
    //     timeRequest: '2022/10/27',
    //     userName: 'وليد',
    //     description: 'الرجاء النظر في الوضع',
    //     photo:
    //         'https://firebasestorage.googleapis.com/v0/b/system-33957.appspot.com/o/2021_11_14_14_8_25_348.jpg?alt=media&token=b64b63c2-3f92-4514-b8fb-63c5a85cf019',
    //     employee: "iduser1209",
    //     state: 'مكتملة',
    //     person: "وليد"),
  ];
  String s = 'مكتملة';
  //fetch Tasks
  Future<void> fetchTasks() async {
    const url =
        'https://system-33957-default-rtdb.firebaseio.com/tasks_post.json';
    tasksPost.clear();
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((bagId, pbag) {
        tasksPost.add(Task(
          idUser: pbag['idUser'],
          idTask: pbag['idTask'],
          department: pbag['department'],
          timeRequest: pbag['timeRequest'],
          userName: pbag['userName'],
          description: pbag['description'],
          photo: pbag['photo'],
          state: pbag['state'],
          person: pbag['person'],
        ));
      });
    } catch (error) {
      //  throw (error);
    }
  }

  // add tasks post
  Future<void> addtasksPost(
    idUser,
    department,
    timeRequest,
    userName,
    description,
    photo,
    state,
    person,
  ) async {
    const url =
        'https://system-33957-default-rtdb.firebaseio.com/tasks_post.json';
    var uuid = const Uuid();
    var x = uuid.v1();
    try {
      http.post(
        Uri.parse(url),
        body: json.encode({
          'idUser': idUser,
          'idTask': x,
          'department': department,
          'timeRequest': timeRequest,
          "userName": userName,
          "person": person,
          "description": description,
          "photo": photo,
          "state": state,
        }),
      );
    } catch (error) {
      //   throw showAlert;
    }
  }
}
