import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/offer/offers.dart';

class OffersPost with ChangeNotifier {
  List<Offers> offerPost = [
    Offers(
      name: 'Walid',
      email: 'walidalayash990@gamil.com',
      phone: '0924385526',
    ),
  ];
  //fetch offers
  Future<void> fetchOffers() async {
    const url =
        'https://system-33957-default-rtdb.firebaseio.com/offers_post.json';
    offerPost.clear();
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((bagId, pbag) {
        offerPost.add(Offers(
          name: pbag['name'],
          email: pbag['email'],
          phone: pbag['phone'],
        ));
      });
    } catch (error) {
      //  throw (error);
    }
  }

  // add offers post
  Future<void> addOffersPost(
    name,
    email,
    phone,
  ) async {
    const url =
        'https://system-33957-default-rtdb.firebaseio.com/offers_post.json';

    try {
      http.post(
        Uri.parse(url),
        body: json.encode({
          'name': name,
          'email': email,
          'phone': phone,
        }),
      );
    } catch (error) {
      //   throw showAlert;
    }
  }
}
