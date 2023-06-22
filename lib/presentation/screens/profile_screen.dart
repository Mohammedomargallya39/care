// import '../../core/util/resources/colors.dart';
// import '../custom_widgets/custom_text.dart';
// import 'auth_screens/login_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../custom_widgets/custom_button.dart';
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     CollectionReference service = FirebaseFirestore.instance.collection('service');
//     return Scaffold(
//       backgroundColor: mainColor,
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 30),
//             Align(
//               alignment: Alignment.center,
//               child: Image.asset(
//                 "assets/images/logo.png",
//                 scale: 2,
//               ),
//             ),
//             Align(
//               alignment: Alignment.topLeft,
//               child: CustomText(
//                 text: "profile".toUpperCase(),
//                 color: Colors.white,
//                 fontsize: 25,
//                 fontwight: FontWeight.bold,
//               ),
//             ),
//             Stack(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 40.0),
//                   child: Container(
//                     height: height * 50 / 100,
//                     width: width - 140,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(width: 2, color: Colors.white),
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(12.0))),
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 50.0, left: 16),
//                       child: Column(
//                         children: [
//                           GestureDetector(
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                   Icons.home,
//                                   color: Color(0xff147294),
//                                   size: 40,
//                                 ),
//                                 const SizedBox(width: 15),
//                                 CustomText(
//                                   text: "Home",
//                                   fontsize: 20,
//                                   fontwight: FontWeight.bold,
//                                   color: const Color(0xff147294),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           GestureDetector(
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                   Icons.call,
//                                   color: Color(0xff147294),
//                                   size: 40,
//                                 ),
//                                 const SizedBox(width: 15),
//                                 CustomText(
//                                   text: "Contact us",
//                                   fontsize: 20,
//                                   fontwight: FontWeight.bold,
//                                   color: const Color(0xff147294),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           GestureDetector(
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                   Icons.alarm,
//                                   color: Color(0xff147294),
//                                   size: 40,
//                                 ),
//                                 const SizedBox(width: 15),
//                                 CustomText(
//                                   text: "Appointments",
//                                   fontsize: 20,
//                                   fontwight: FontWeight.bold,
//                                   color: const Color(0xff147294),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           GestureDetector(
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                   Icons.settings,
//                                   color: Color(0xff147294),
//                                   size: 40,
//                                 ),
//                                 const SizedBox(width: 15),
//                                 CustomText(
//                                   text: "Settings",
//                                   fontsize: 20,
//                                   fontwight: FontWeight.bold,
//                                   color: const Color(0xff147294),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: height * 50 / 100,
//                   width: width - 100,
//                   child: Container(
//                     height: 80,
//                     width: 80,
//                     decoration: const BoxDecoration(
//                         image: DecorationImage(
//                       alignment: Alignment.topRight,
//                       image: AssetImage("assets/images/perso.png"),
//                     )),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 35),
//             Center(
//               child: Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(28.5),
//                   ),
//                 ),
//                 child: CustomButton(
//                   onpressed: () async {
//                     await FirebaseAuth.instance.signOut();
//                     // ignore: use_build_context_synchronously
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (_) => LoginScreen()),
//                     );
//                   },
//                   size: const Size(120, 45),
//                   child: const Text(
//                     "signOut",
//                     style: TextStyle(
//                       color: Color(0xff147294),
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
