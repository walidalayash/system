import 'package:flutter/material.dart';
import 'package:system/ui/view/home/home.dart';
import '../activity_page/activity_page.dart';
import '../profile_page/profile_page.dart';

class Root extends StatefulWidget {
  const Root({
    super.key,
  });

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int activeTab = 0;
  void callback(int index) {
    setState(() {
      activeTab = index;
    });
  }

  List itemsTab = [
    {"icon": Icons.home, "size": 20.0},
    {"icon": Icons.task, "size": 20.0},
    {"icon": Icons.person, "size": 20.0},
  ];

  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: getFooter(),

      ///AppBar
      appBar: activeTab == 0
          ? AppBar(
              elevation: 0.8,
              backgroundColor: const Color.fromARGB(255, 73, 101, 58),
              title: const Center(
                child: Text(
                  "الرئيسية",
                  style: TextStyle(color: Colors.white, fontFamily: "Karla"),
                ),
              ),
            )
          : activeTab == 1
              ? AppBar(
                  elevation: 0.8,
                  backgroundColor: const Color.fromARGB(255, 73, 101, 58),
                  title: const Center(
                    child: Text(
                      "النشاطات",
                      style:
                          TextStyle(color: Colors.white, fontFamily: "Karla"),
                    ),
                  ),
                )
              : activeTab == 2
                  ? AppBar(
                      elevation: 0.8,
                      backgroundColor: const Color.fromARGB(255, 73, 101, 58),
                      title: const Center(
                        child: Text(
                          "بيانات الشخصية",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Karla"),
                        ),
                      ),
                    )
                  : AppBar(
                      elevation: 0.8,
                      backgroundColor: const Color.fromARGB(255, 241, 194, 69),
                      title: const Text(
                        "",
                        style:
                            TextStyle(color: Colors.white, fontFamily: "Karla"),
                      ),
                    ),

      //appBar end
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: const [
        Home(),
        ActivityPage(),
        ProfilePage(),
      ],
    );
  }

  Widget getFooter() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 73, 101, 58),
          border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.2)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(itemsTab.length, (index) {
              return IconButton(
                  icon: Icon(
                    itemsTab[index]['icon'],
                    size: itemsTab[index]['size'],
                    color: activeTab == index ? Colors.black : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      activeTab = index;
                    });
                  });
            })),
      ),
    );
  }
}
