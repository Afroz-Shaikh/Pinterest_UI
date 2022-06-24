import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinterest_ui/screens/home_page.dart';

class NavbarUI extends StatefulWidget {
  int selectedPageIndex = 0;

  NavbarUI({this.selectedPageIndex = 0});

  @override
  State<NavbarUI> createState() => _NavbarUIState();
}

class InnerPage {
  Widget page;
  String title;
  InnerPage(this.page, this.title);
}

class _NavbarUIState extends State<NavbarUI> {
  List<InnerPage> _pages = [];

  @override
  void initState() {
    _pages = [
      InnerPage(HomePage(), 'Home'),
      InnerPage(
          Center(
              child: Text(
            'search',
            style: TextStyle(color: Colors.white),
          )),
          'Search'),
      InnerPage(
          Center(
              child: Text(
            'msg',
            style: TextStyle(color: Colors.red),
          )),
          'msg'),
      InnerPage(Center(child: Text('account')), 'account'),
    ];
  }

  void _selectPage(int index) {
    setState(() {
      widget.selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
            child: Scaffold(
          backgroundColor: Colors.red,
          body: _pages[widget.selectedPageIndex].page,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)]),
            child: BottomAppBar(
              color: Colors.black,
              elevation: 12,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 12,
                child: Row(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              _selectPage(0);
                            },
                            child: SvgPicture.asset(
                              'assets/svgs/home.svg',
                              color: customColor(0, widget.selectedPageIndex),
                            )
                            // Icon(
                            //   Icons.home,
                            //   color: customColor(0, widget.selectedPageIndex),
                            // ),
                            )),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              _selectPage(1);
                            },
                            child: SvgPicture.asset(
                              'assets/svgs/search.svg',
                              color: customColor(1, widget.selectedPageIndex),
                            ))),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        _selectPage(2);
                      },
                      child: SvgPicture.asset(
                        'assets/svgs/msg.svg',
                        color: customColor(2, widget.selectedPageIndex),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        _selectPage(3);
                      },
                      child: SvgPicture.asset(
                        'assets/svgs/account.svg',
                        color: customColor(3, widget.selectedPageIndex),
                      ),
                    )),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )),
        Banner(
            color: Colors.blue,
            message: 'Afroz',
            location: BannerLocation.topStart),
      ],
    );
  }
}

Color customColor(int pageIndex, int selectedPageIndex) {
  if (pageIndex == selectedPageIndex) {
    return Colors.white;
  } else {
    return Colors.grey.withOpacity(0.5);
  }
}
