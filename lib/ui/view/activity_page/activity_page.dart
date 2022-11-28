import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system/ui/shared/ui_helper.dart';

import '../../../core/data_sources/activity/activity_post.dart';
import '../../../core/models/activity/activity.dart';
import '../details_page/details_page.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  var _isInit = true;

  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ActivityPost>(context, listen: false)
          .fetchActivity()
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
            body: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : body(context)));
  }

  Widget body(context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<Activity> activityPost =
        Provider.of<ActivityPost>(context, listen: false).activityPost;
    return SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              textAlign: TextAlign.end,
              // controller: searchController,
              decoration: InputDecoration(
                hintText: 'بحث',
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          Wrap(
            children: List.generate(activityPost.length, (index) {
              return InkWell(
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
                              child: Text(activityPost[index].userName,
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
                            activityPost[index].description,
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
                              child: Image.network(activityPost[index].photo)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 150,
                          ),
                          child: Text(
                            activityPost[index].timeRequest,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                fontFamily: 'Karla2'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetalisPage(
                        userName: activityPost[index].userName,
                        department: activityPost[index].department,
                        description: activityPost[index].description,
                        something: activityPost[index].idUser,
                        photo: activityPost[index].photo,
                        quantity: activityPost[index].timeRequest,
                        state: activityPost[index].idUser);
                  }));
                },
              );
            }),
          )
        ]));
  }
}
