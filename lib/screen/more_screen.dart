import 'package:copy_ems/constrains/bottom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      appBar: AppBar(
        title: const Text(
          'More',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
       body:  Container(
         //padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
         child: Column(
           children: <Widget>[
             Container(
               padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
               child: Expanded(
                   child:Row(
                     children: <Widget>[
                     Container(
                       child: Expanded(
                         child: TextButton.icon(
                           style: ButtonStyle(
                               backgroundColor: MaterialStateProperty.all(Colors.black12)),
                           onPressed: () {},
                           icon: const Icon(Icons.notification_important_rounded,
                             size: 30.00,
                             color: Colors.blue,
                           ),
                           label: const Text(
                             '   Notification',
                             style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ),
                       ),
                     ),
                     ],
                   ),
               ),
             ),
             Container(
               padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
               child: Expanded(
                 child:Row(
                   children: <Widget>[
                     Expanded(
                       child: TextButton.icon(
                         style: ButtonStyle(
                             backgroundColor: MaterialStateProperty.all(Colors.black12)),
                         onPressed: () {},
                         icon: const Icon(Icons.logout,
                           size: 30.00,
                           color: Colors.blue,
                         ),
                         label: const Text(
                           '   Log-Out',
                           style: TextStyle(
                             color: Colors.black,
                             fontWeight: FontWeight.bold,
                           ),
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

      // Container(
      //   padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      //   child: Expanded(
      //     child: Row(
      //       children:  <Widget>[
      //         Expanded(
      //             child: TextButton.icon(
      //               style: ButtonStyle(
      //                   backgroundColor: MaterialStateProperty.all(Colors.black12)),
      //               onPressed: () {},
      //               icon: const Icon(Icons.notification_important_rounded,
      //                 size: 30.00,
      //                 color: Colors.blue,
      //               ),
      //               label: const Text(
      //                 '   Notification',
      //                 style: TextStyle(
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //               ),
      //           ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
