import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/data_sources/user/user.dart';
import '../../../core/models/user/user.dart';
import '../../shared/ui_helper.dart';

class EmpoloyeesInfoPage extends StatefulWidget {
  const EmpoloyeesInfoPage({super.key});

  @override
  State<EmpoloyeesInfoPage> createState() => _EmpoloyeesInfoPageState();
}

class _EmpoloyeesInfoPageState extends State<EmpoloyeesInfoPage> {
  var _isInit = true;

  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Users>(context, listen: false).fetchUsers().then((_) {
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
            backgroundColor: const Color.fromARGB(255, 73, 101, 58),
            leading: const BackButton(
              color: Colors.white, // <-- SEE HERE
            ),
            title: const Center(
                child: Text("الموظفين",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Karla')))),
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : body()));
  }

  Widget body() {
    List<UserAccount> postUsers =
        Provider.of<Users>(context, listen: false).postUsers;
    return Column(children: <Widget>[
      UIHelper.verticalSpaceMedium(),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          textAlign: TextAlign.end,
          // controller: searchController,
          decoration: InputDecoration(
            hintText: 'بحث',
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
      ),
      Wrap(
        children: List.generate(postUsers.length, (index) {
          return Column(
            children: [
              UIHelper.verticalSpaceLarge(),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(11)),
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
                        Text(postUsers[index].userName,
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
                        Text("+${postUsers[index].phone}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'Karla2')),
                        const Text('البريد الألكتروني',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'Karla')),
                        Text(postUsers[index].email,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'Karla2'))
                      ],
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpaceLarge(),
              const Divider(
                color: Colors.grey,
              ),
            ],
          );
        }),
      ),
    ]);
  }
}
