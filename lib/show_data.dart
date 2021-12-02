import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('location').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        // if (snapshot.hasError) {
        //   return Text('Something went wrong');
        // }

        // if (snapshot.connectionState == ConnectionState.waiting) {
        //
        //   print('error message:  ');
        //   print(snapshot.connectionState);
        //   return Text("Loading");
        // }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            print('return data: ');
            print(data['location']);
            print(data['text']);
            return ListTile(
              title: Text(data['location']),
              subtitle: Text(data['text']),
            );
          },
          ).toList(),
        );
      },
    );
  }
}











// class GetUserName extends StatelessWidget {
//    final String documentId;
//
//   GetUserName(this.documentId);
//
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference firebase = FirebaseFirestore.instance.collection('location');
//
//     return FutureBuilder<DocumentSnapshot>(
//       future: firebase.doc(documentId).get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//
//         if (snapshot.hasError) {
//           return const Center(child: Text("snapshot has error"));
//         }
//
//         if (snapshot.hasData && !snapshot.data!.exists) {
//           print(snapshot.hasData);
//           print(snapshot.data);
//           return const Center(child: Text("Document does not exist"));
//         }
//
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
//           return Text("Location: ${data['location']}");
//         }
//
//         return const Center(child: Text("loading"));
//       },
//     );
//   }
// }












// class StoreDataR extends StatelessWidget {
//   const StoreDataR({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     final firebase = FirebaseFirestore.instance;
//     return Scaffold(
//       floatingActionButton: null,
//       body: StreamBuilder(
//         stream:  firebase.collection('office').snapshots(),
//           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     DocumentSnapshot doc = snapshot.data!.docs[index];
//                     print('Document : $doc');
//                     Text(snapshot.data!.docs[index].get('location'));
//                     //print("Location : $loc");
//                     return Text(doc['location']);
//                   });
//             }
//             else
//               {
//                 return const Text("No data");
//               }
//         }
//       ),
//     );
//   }
// }










//   Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Show STORE DATA"),
    //     centerTitle: true,
    //   ),
    //   body: StreamBuilder<QuerySnapshot>(
    //     stream: firebase.collection('office').snapshots(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         return ListView.builder(
    //             itemCount: snapshot.data!.docs.length,
    //             itemBuilder: (context, index) {
    //               DocumentSnapshot doc = snapshot.data!.docs[index];
    //               //Text(snapshot.data!.docs[index].get('longitude'));
    //               //Text(snapshot.data!.docs[index].get('location'));
    //               //Text(snapshot.data!.docs[index].get('latitude'));
    //               return Text(doc['location']);
    //             });
    //       }
    //       else {
    //         return const Text("No data");
    //       }
    //     },
    //   )
    // );

// Text(snapshot.data!.docs[index].get('latitude')),
// Text(snapshot.data!.docs[index].get('longitude')),
// Text(snapshot.data!.docs[index].get('location')),