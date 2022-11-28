import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system/core/models/offer/offers.dart';

import '../../../core/data_sources/offer/offers_post.dart';
import '../../shared/ui_helper.dart';

class Offer extends StatefulWidget {
  const Offer({super.key});

  @override
  State<Offer> createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  var _isInit = true;

  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<OffersPost>(context, listen: false).fetchOffers().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 78, 84, 91),
            title: const Center(
                child: Text(
              "العروض المقدمة",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'Karla'),
            ))),
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : body(context)));
  }

  Widget body(context) {
    List<Offers> offerPost =
        Provider.of<OffersPost>(context, listen: false).offerPost;
    return Wrap(
        children: List.generate(offerPost.length, (index) {
      return Column(children: <Widget>[
        UIHelper.verticalSpaceExtraLarge(),
        Stack(
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                margin: const EdgeInsets.only(left: 10, right: 10),
                height: 200,
                width: 315,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(11)),
                  border: Border.all(
                    color: const Color.fromARGB(255, 233, 233, 233),
                  ),
                  color: const Color.fromARGB(255, 251, 251, 251),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 211, 211, 211),
                      blurRadius: 2.0,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset('assets/person.png')),
                  UIHelper.verticalSpaceMedium(),
                  Text(offerPost[index].name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Karla'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150, top: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('رقم الهاتف',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Karla')),
                  Text(offerPost[index].phone,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Karla2')),
                  const Text('البريد الألكتروني',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Karla')),
                  Text(offerPost[index].email,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Karla2'))
                ],
              ),
            ),
          ],
        )
      ]);
    }));
  }
}
