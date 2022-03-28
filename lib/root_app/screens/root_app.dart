import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/home/screens/home_screen.dart';
import 'package:flutter_provider/profile/screens/profile.dart';
import 'package:line_icons/line_icons.dart';

import '../../constants/styles.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  void initState() {
    super.initState();
    pageIndex = 3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        Home(),
        Center(
          child: Text("Chart"),
        ),
        Center(
          child: Text("Camera"),
        ),
        Center(
          child: ProfileScreen(),
        ),
      ],
    );
  }

  Widget getFooter() {
    List items = [LineIcons.home, LineIcons.pieChart, LineIcons.camera, LineIcons.user];
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(top: BorderSide(width: 1, color: Colors.black.withOpacity(0.06))),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  pageIndex = index;
                });
              },
              child: Column(
                children: [
                  Icon(
                    items[index],
                    size: 28,
                    color: pageIndex == index ? Styles.colors.thirdColor : Theme.of(context).iconTheme.color,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  pageIndex == index
                      ? Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(color: Styles.colors.thirdColor, shape: BoxShape.circle),
                        )
                      : Container()
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
