import 'package:copy_ems/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:copy_ems/DatabaseManager/database_manager.dart';
import 'package:copy_ems/constrains/bottom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:timelines/timelines.dart';

class AdminDashboard extends StatefulWidget {
  static const String id = 'dashboard_screen';
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  List timelinedatalist = [];

  @override
  void initState() {
    fetchDatabasList();
    super.initState();

    getCurrentUser();
  }
  void getCurrentUser() async
  {
    try
    {
      final user = await _auth.currentUser;
      if(user != null)
        {
          loggedInUser = user;
          print(loggedInUser.email);
        }
    }
    catch(e)
    {
      print(e);
    }
  }

  fetchDatabasList() async
  {
    Map<String, dynamic> resultList = await DatabaseManager().getDataOnTimeLineView();

    if(resultList == null)
    {
      print('No Data found');
    }
    else
    {
     setState(() {
       timelinedatalist = resultList as List;
     });
      //print(timelinedatalist);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 5,left: 5,right: 5),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Expanded(
                  child: Row(
                    children:  <Widget>[
                      Expanded(
                        child: Row(
                          children:  const <Widget>[
                            Icon(Icons.people, color: Colors.deepPurpleAccent),
                            SizedBox(width: 4.0,),
                            Expanded(
                              child: Text(
                                'Total Employee',
                                style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.black,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Expanded(
                        child: Row(
                          children: const <Widget>[
                            Icon(Icons.arrow_circle_down, color: Colors.green,),
                            SizedBox(width: 4.0,),
                            Expanded(
                              child: Text(
                                'Working Time',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.black,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: Row(
                          children:  const <Widget>[
                            Icon(Icons.arrow_circle_up, color: Colors.red,),
                            SizedBox(width: 4.0,),
                            Expanded(
                              child: Text(
                                'Absent Employee',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              child: Expanded(
                child: Row(
                  children:  <Widget>[
                    Expanded(
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8.0),
                          //scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (context, index){
                              //print('test result: ${timelinedatalist.length},');
                              return Container(
                                padding: const EdgeInsets.only(left: 10,right: 10),
                                child: const Card(
                                  color: Color(0xC4C4C4),
                                  child: ListTile(
                                    title: Text('test'),
                                    subtitle: Text('data'),
                                    //title: Text(timelinedatalist[index]['location']),
                                    //subtitle: Text(timelinedatalist[index]['text']),
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
