import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import '../../models/user/user.dart';

class Users with ChangeNotifier {
  List<UserAccount> usersNow = [];
  List<UserAccount> postUsers = [];
  //fetch users
  Future<void> fetchUsers() async {
    const url = 'https://system-33957-default-rtdb.firebaseio.com/users.json';
    postUsers.clear();
    final phone = FirebaseAuth.instance.currentUser?.phoneNumber;

    try {
      final response = await http.get(
        Uri.parse(url),
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((bagId, pbag) {
        postUsers.add(UserAccount(
          idUser: pbag['idUser'],
          userName: pbag['userName'],
          phone: pbag['phone'],
          email: pbag['email'],
          department: pbag['department'],
          place: pbag['place'],
        ));
      });
      for (int i = postUsers.length - 1; i >= 0; i--) {
        if (phone.toString() == '+${postUsers[i].phone}') {
          usersNow.add(UserAccount(
              email: postUsers[i].email,
              userName: postUsers[i].userName,
              phone: postUsers[i].phone,
              idUser: postUsers[i].idUser,
              place: postUsers[i].place,
              department: postUsers[i].department));
        }
      }
      print('--------');
      print(usersNow[0].phone);
    } catch (error) {
      //  throw (error);
    }
  }

  Future<void> addUsers(userName, phone, email, department, place) async {
    const url = 'https://system-33957-default-rtdb.firebaseio.com/users.json';
    var uuid = const Uuid();
    var x = uuid.v1();
    try {
      http.post(
        Uri.parse(url),
        body: json.encode({
          'idUser': x,
          'userName': userName,
          'phone': phone,
          'email': email,
          'department': department,
          'place': place
        }),
      );
    } catch (error) {
      //   throw showAlert;
    }
  }
}
