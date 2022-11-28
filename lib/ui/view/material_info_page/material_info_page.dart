import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system/ui/shared/ui_helper.dart';

import '../../../core/data_sources/material/materials_post.dart';
import '../../../core/data_sources/tasks/tasks_post.dart';
import '../../../core/models/material/material.dart';
import '../details_page/details_page.dart';

class MaterialInfokPage extends StatefulWidget {
  const MaterialInfokPage({super.key});

  @override
  State<MaterialInfokPage> createState() => _MaterialInfokPageState();
}

class _MaterialInfokPageState extends State<MaterialInfokPage> {
  var _isInit = true;

  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<MaterialsPost>(context, listen: false)
          .fetchMaterials()
          .then((_) {
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
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 73, 101, 58),
                leading: const BackButton(
                  color: Colors.white, // <-- SEE HERE
                ),
                title: const Center(
                    child: Text(
                  'معلومات المواد',
                  style: TextStyle(color: Colors.white, fontFamily: 'Karla'),
                ))),
            body: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : body(context)));
  }

  Widget body(context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(children: <Widget>[
          UIHelper.verticalSpaceLarge(),
          Provider.of<TasksPost>(context, listen: false).s == 'مكتملة'
              ? Column(
                  children: [bar1(context), card(context, 'مكتملة')],
                )
              : Provider.of<TasksPost>(context, listen: false).s == 'مستمرة'
                  ? Column(
                      children: [bar2(), card(context, 'مستمرة')],
                    )
                  : Provider.of<TasksPost>(context, listen: false).s == 'محذوفة'
                      ? Column(
                          children: [bar3(), card(context, 'محذوفة')],
                        )
                      : Container(),
        ]));
  }

  Widget bar1(context) {
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Center(
          child: Container(
            width: width - 20,
            height: 50,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 224, 224, 224),
              borderRadius: BorderRadius.all(Radius.circular(11)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 224, 224, 224),
                  blurRadius: 2.0,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: InkWell(
                child: const Text('مستمرة',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla2')),
                onTap: () {
                  setState(() {
                    Provider.of<TasksPost>(context, listen: false).s = 'مستمرة';
                  });
                },
              ),
            ),
            const Text('|'),
            Stack(children: [
              Center(
                child: Container(
                  width: 150,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(11)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                child: const Padding(
                  padding: EdgeInsets.only(left: 50, top: 5),
                  child: Text('مكتملة ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Karla2')),
                ),
                onTap: () {
                  setState(() {
                    Provider.of<TasksPost>(context, listen: false).s = 'مكتملة';
                  });
                },
              ),
            ]),
            const Text('|'),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                child: const Text('محذوفة',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla2')),
                onTap: () {
                  setState(() {
                    Provider.of<TasksPost>(context, listen: false).s = 'محذوفة';
                  });
                },
              ),
            ),
          ]),
        ),
      ],
    );
  }

  Widget bar2() {
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Center(
          child: Container(
            width: width - 20,
            height: 50,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 224, 224, 224),
              borderRadius: BorderRadius.all(Radius.circular(11)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 224, 224, 224),
                  blurRadius: 2.0,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Stack(children: [
              Center(
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(11)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: InkWell(
                  child: const Text('مستمرة',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Karla2')),
                  onTap: () {
                    setState(() {
                      Provider.of<TasksPost>(context, listen: false).s =
                          'مستمرة';
                    });
                  },
                ),
              ),
            ]),
            const Text('|'),
            InkWell(
              child: const Padding(
                padding: EdgeInsets.only(),
                child: Text('مكتملة ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla2')),
              ),
              onTap: () {
                setState(() {
                  Provider.of<TasksPost>(context, listen: false).s = 'مكتملة';
                });
              },
            ),
            const Text('|'),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                child: const Text('محذوفة',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla2')),
                onTap: () {
                  setState(() {
                    Provider.of<TasksPost>(context, listen: false).s = 'محذوفة';
                  });
                },
              ),
            ),
          ]),
        ),
      ],
    );
  }

  Widget bar3() {
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Center(
          child: Container(
            width: width - 20,
            height: 50,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 224, 224, 224),
              borderRadius: BorderRadius.all(Radius.circular(11)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 224, 224, 224),
                  blurRadius: 2.0,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: InkWell(
                child: const Text('مستمرة',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla2')),
                onTap: () {
                  setState(() {
                    Provider.of<TasksPost>(context, listen: false).s = 'مستمرة';
                  });
                },
              ),
            ),
            const Text('|'),
            InkWell(
              child: const Padding(
                padding: EdgeInsets.only(),
                child: Text('مكتملة ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Karla2')),
              ),
              onTap: () {
                setState(() {
                  Provider.of<TasksPost>(context, listen: false).s = 'مكتملة';
                });
              },
            ),
            const Text('|'),
            Stack(children: [
              Center(
                child: Container(
                  width: 120,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(11)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 30),
                child: InkWell(
                  child: const Text('محذوفة',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Karla2')),
                  onTap: () {
                    setState(() {
                      Provider.of<TasksPost>(context, listen: false).s =
                          'محذوفة';
                    });
                  },
                ),
              ),
            ])
          ]),
        ),
      ],
    );
  }

  Widget card(context, type) {
    List<MaterialCompany> materialPost =
        Provider.of<MaterialsPost>(context, listen: false).materialsPost;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Wrap(
      children: List.generate(materialPost.length, (index) {
        return materialPost[index].state == type
            ? InkWell(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        UIHelper.verticalSpaceLarge(),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(30, 3, 20, 0),
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          height: height / 3.6,
                          width: width / 1.3,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(11)),
                            border: Border.all(
                              color: const Color.fromARGB(255, 233, 233, 233),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 211, 211, 211),
                                blurRadius: 1.5,
                              ),
                            ],
                            color: const Color.fromARGB(255, 251, 251, 251),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50, top: 40),
                              child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset('assets/person.png')),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 150, top: 40),
                              child: Text(materialPost[index].userName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: 'Karla2')),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 130,
                          ),
                          child: Text(
                            materialPost[index].description,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Karla',
                              color: Color.fromARGB(255, 65, 102, 52),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 150,
                          ),
                          child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.network(materialPost[index].photo)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 150,
                          ),
                          child: Text(materialPost[index].quantity,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  fontFamily: 'Karla2')),
                        ),
                      ],
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetalisPage(
                        userName: materialPost[index].userName,
                        department: materialPost[index].department,
                        description: materialPost[index].description,
                        something: materialPost[index].material,
                        photo: materialPost[index].photo,
                        quantity: materialPost[index].quantity,
                        state: materialPost[index].state);
                  }));
                },
              )
            : Container();
      }),
    );
  }
}
