import 'package:flutter/material.dart';

class DetalisPage extends StatelessWidget {
  final String userName;
  final String department;
  final String description;
  final String something;
  final String photo;
  final String quantity;
  final String state;
  const DetalisPage({
    Key? key,
    required this.userName,
    required this.department,
    required this.description,
    required this.something,
    required this.photo,
    required this.quantity,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                    backgroundColor: const Color.fromARGB(255, 73, 101, 58),
                    leading: const BackButton(
                      color: Colors.white, // <-- SEE HERE
                    ),
                    title: const Center(
                        child: Text(
                      'التفاصيل',
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Karla'),
                    ))),
                body: body(context))));
  }

  Widget body(context) {
    return SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(userName),
              Text(department),
              Text(description),
              Text(something),
              Image.network(photo),
              Text(quantity),
              Text(state),
            ]));
  }
}
