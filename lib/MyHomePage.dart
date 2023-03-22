import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'NavDrawer.dart';
import 'getData.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PanelController panelController = PanelController();
  String panelName = '';
  String panelId = '';
  String panelPhone = '';
  String panelEmail = '';
  String panelRole = '';
  String panelStatus = '';
  Color roleColor;
  bool isPanelOpen = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int selectedButtonIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottomOpacity: 0.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('Staff List', style: TextStyle(color: Color.fromRGBO(184, 39, 72, 1.0))),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Color.fromRGBO(184, 39, 72, 1.0),
          ),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        actions: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.red.shade50,
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.notifications_rounded,
                  color: Color.fromRGBO(184, 39, 72, 1.0),
                ),
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey.shade400,
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Do something when the second profile icon is pressed
                },
              ),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      drawer: const NavDrawer(),
      body: floatingPanel(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: (!isPanelOpen)
          ? FloatingActionButton(
              child: Icon(Icons.person_add_alt_1),
              backgroundColor: Color.fromRGBO(184, 39, 72, 1.0),
              onPressed: () async {
                final staffList = await fetchStaffList();
                print(staffList[0]); // prints the list of staff members
              },
            )
          : Container(),
    );
  }

  Widget UserDialouge({String role, String name, String id_card, String status}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 13, top: 8, bottom: 8),
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 8),
              decoration: BoxDecoration(
                color: roleColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: RotatedBox(quarterTurns: 3, child: new Text(role))),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 1.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey.shade400,
                    child: Center(
                      child: Icon(
                        Icons.person,
                        size: 45,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(children: [
                        Text(name),
                        SizedBox(width: 5),
                        (status == '1')
                            ? Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 15,
                              )
                            : Icon(
                                Icons.cancel,
                                color: Colors.red,
                                size: 15,
                              ),
                      ]),
                      SizedBox(height: 4),
                      Text(id_card),
                    ],
                  ),
                ],
              ),
              Icon(Icons.navigate_next),
            ],
          ),
        ),
      ],
    );
  }

  Widget roundedButton(int buttonIndex, String buttonName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5),
      child: Material(
        color: buttonIndex == selectedButtonIndex ? Colors.red.shade900 : Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        child: InkWell(
          onTap: () {
            setState(() {
              selectedButtonIndex = buttonIndex;
            });
          },
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.black45, width: 1.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text(
              buttonName,
              style: TextStyle(
                color: buttonIndex == selectedButtonIndex ? Colors.white : Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget floatingPanel() {
    return Scaffold(
        body: SlidingUpPanel(
      controller: panelController,
      minHeight: 0,
      backdropEnabled: true,
      maxHeight: isPanelOpen ? 400 : 280,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          blurRadius: 4,
        ),
      ],
      onPanelSlide: (double position) {
        if (position == 0 && (isPanelOpen == true)) {
          setState(() {
            isPanelOpen = false;
          });
        }
      },
      panel: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          children: [
            Container(
              width: 55,
              height: 6,
              decoration: BoxDecoration(
                color: Color(0x3eBFBBB2),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Color(0x3eBFBBB2).withOpacity(0.5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: -0.5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.grey.shade400,
              child: Center(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                panelName,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 5,
              ),
              (panelStatus == "1")
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 18,
                    )
                  : Icon(
                      Icons.cancel,
                      color: Colors.red,
                      size: 15,
                    ),
            ]),
            SizedBox(
              height: 2,
            ),
            Text(
              panelId,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 10, left: 40, right: 40),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(25.0),
              ),
              height: 180,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Role",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    panelRole,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    "Phone Number",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    panelPhone,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    "Email Id",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    panelEmail,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
              ),
            ),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8), fontSize: 18)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              roundedButton(0, 'All Staffs'),
              roundedButton(1, 'Active Staffs'),
              roundedButton(2, 'Inactive Staffs'),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          FutureBuilder(
              future: fetchStaffList(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          String tempRole = snapshot.data[index]['role'];
                          if(tempRole == 'ADMIN'){
                            roleColor = Colors.blue.shade100;
                          }else if(tempRole == 'MANAGER'){
                            roleColor = Colors.purple.shade50;
                          }else if(tempRole == 'STAFF'){
                            roleColor = Colors.green.shade100;
                          }else{
                            roleColor = Colors.blue.shade100;
                          }
                          return GestureDetector(
                            onTap: () async {
                              if (panelController.isAttached) {
                                setState(() {
                                  isPanelOpen = true;
                                  panelName = snapshot.data[index]['name'];
                                  panelId = snapshot.data[index]['id_card'];
                                  panelPhone = snapshot.data[index]['phone_number'];
                                  panelEmail = snapshot.data[index]['email_address'];
                                  panelRole = snapshot.data[index]['role'];
                                  panelStatus = snapshot.data[index]['status'];
                                });
                                await panelController.open();
                              }
                            },
                            child: UserDialouge(
                              role: snapshot.data[index]['role'],
                              name: snapshot.data[index]['name'],
                              id_card: snapshot.data[index]['id_card'],
                              status: snapshot.data[index]['status'],
                            ),
                          );
                        }));
              }),
        ],
      ),
    ));
  }
}
