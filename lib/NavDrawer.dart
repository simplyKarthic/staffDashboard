import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constant.dart';


class NavDrawer extends StatelessWidget {
  const NavDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.65,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 120.0,
                        height: 120.0,
                        child: Center(
                          child: Image.asset('assets/logo.png')
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 1, 10, 1),
                child: ListTile(
                  focusColor: Color.fromRGBO(184, 39, 72, 0.5),
                  leading: const Icon(Icons.home_sharp, color: Color.fromRGBO(184, 39, 72, 1.0),),
                  title: const Text('Home', style: TextStyle(color: Color.fromRGBO(184, 39, 72, 1.0)),),
                  onTap: () => {

                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 1, 10, 1),
                child: ListTile(
                  leading: const Icon(Icons.view_list_outlined, color: Color.fromRGBO(184, 39, 72, 1.0)),
                  title: const Text('Exhibitors List', style: TextStyle(color: Color.fromRGBO(184, 39, 72, 1.0))),
                  onTap: () => {
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 1, 10, 1),
                child: ListTile(
                  leading: const Icon(Icons.trending_up, color: Color.fromRGBO(184, 39, 72, 1.0)),
                  title: const Text('Reports', style: TextStyle(color: Color.fromRGBO(184, 39, 72, 1.0))),
                  onTap: () => {
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 1, 10, 1),
                child: ListTile(
                  leading: const Icon(Icons.settings, color: Color.fromRGBO(184, 39, 72, 1.0)),
                  title: const Text('Settings', style: TextStyle(color: Color.fromRGBO(184, 39, 72, 1.0))),
                  onTap: () => {
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 1, 10, 1),
                child: ListTile(
                  leading: const Icon(Icons.logout, color: Color.fromRGBO(184, 39, 72, 1.0)),
                  title: const Text('Logout', style: TextStyle(color: Color.fromRGBO(184, 39, 72, 1.0))),
                  onTap: () => {
                  },
                ),
              ),
            ],
        ),
      ),
    );
  }
}
