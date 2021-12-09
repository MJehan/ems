import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'admin/screen/dashboard.dart';
import 'login/login_screen.dart';
import 'login/registration.dart';
import 'my_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
      const ScreenBreakpoints(desktop: 800, tablet: 550, watch: 200),
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  runApp(
      MaterialApp(
          initialRoute: email == null ? LoginScreen.id : MyProfile.id,
        routes: {
          //WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          MyProfile.id: (context) => const MyProfile(),
          RegistrationScreen.id: (context) => const RegistrationScreen(),
          AdminDashboard.id: (context) => const AdminDashboard(),
        },
        debugShowCheckedModeBanner: false,
      )
  );
}

// void main() async
// {
//   FlutterError.onError = (FlutterErrorDetails details) {
//     FlutterError.presentError(details);
//     print(Error);
//     if (kReleaseMode)
//       exit(1);
//   };
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   ResponsiveSizingConfig.instance.setCustomBreakpoints(
//     const ScreenBreakpoints(desktop: 800, tablet: 550, watch: 200),
//   );
//
//   runApp( MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'EMS',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       //home: const AdminDashboard(),
//       initialRoute:LoginScreen.id,
//       routes: {
//         //WelcomeScreen.id: (context) => WelcomeScreen(),
//         LoginScreen.id: (context) => LoginScreen(),
//         MyProfile.id: (context) => const MyProfile(),
//         RegistrationScreen.id: (context) => const RegistrationScreen(),
//         AdminDashboard.id: (context) => const AdminDashboard(),
//       },
//       //home:   const RegistrationScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
