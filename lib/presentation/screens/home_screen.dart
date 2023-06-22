// import '../../model/user_model.dart';
// import '../custom_widgets/custom_text_form_field.dart';
// import 'service_view.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// import '../../core/util/resources/colors.dart';
// import '../../core/util/widgets/custom_bottom_navigation_bar.dart';
// import '../custom_widgets/custom_text.dart';
//
// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});
//
//   Widget userData(width, height) {
//     CollectionReference users = FirebaseFirestore.instance.collection("users");
//     final user = FirebaseAuth.instance.currentUser;
//     return StreamBuilder<QuerySnapshot>(
//         stream: users.where("id", isEqualTo: user!.uid).snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return const Center(child: Text("ERROR"));
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasData) {
//             final data = snapshot.requireData;
//             return ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: data.size,
//                 itemBuilder: (context, index) {
//                   return Row(
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Image.asset("assets/images/hi.png"),
//                               const SizedBox(width: 3),
//                               CustomText(
//                                 text: "Hello",
//                                 color: Colors.white,
//                                 fontsize: 23,
//                               ),
//                             ],
//                           ),
//                           CustomText(
//                             text: snapshot.data!.docs[index]["name"] ??
//                                 "abdelrahman".toUpperCase(),
//                             color: Colors.white,
//                             fontsize: 25,
//                             fontwight: FontWeight.bold,
//                           ),
//                         ],
//                       ),
//                       const Spacer(),
//                       Container(
//                         height: 50,
//                         width: 50,
//                         decoration: BoxDecoration(
//                           color: const Color(0xff7c94b6),
//                           image: DecorationImage(
//                             image: NetworkImage(
//                               snapshot.data!.docs[index]["photoURL"] ??
//                                   "https://firebasestorage.googleapis.com/v0/b/care-aac8d.appspot.com/o/images%2Fperso.png?alt=media&token=c6f1693a-2c63-4ba2-9e86-860180108cf6",
//                             ),
//                             fit: BoxFit.cover,
//                           ),
//                           border: Border.all(width: 2, color: secondryColor),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ],
//                   );
//                 });
//           }
//           return const Text("");
//         });
//   }
//
//   Widget searchBox() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
//       child: CustomTextFormField(
//         text: "",
//         hint: "Search Here!",
//         suffixIcon: const Icon(Icons.tune),
//         prefixIcon: const Icon(Icons.search),
//       ),
//     );
//   }
//
//   Widget services(height) {
//     CollectionReference categories =
//         FirebaseFirestore.instance.collection('categories');
//     return StreamBuilder<QuerySnapshot>(
//       stream: categories.snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Center(child: Text("ERROR"));
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         if (snapshot.hasData) {
//           return SizedBox(
//             height: height * 12.2 / 100,
//             child: ListView.separated(
//               separatorBuilder: (context, index) => const SizedBox(width: 6),
//               scrollDirection: Axis.horizontal,
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (_) => ServiceView(
//                                 model: snapshot.data!.docs[index],
//                               )),
//                     );
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 8, right: 8),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(height: 15),
//                         Row(
//                           children: [
//                             Container(
//                               height: 60,
//                               width: 52,
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   image: NetworkImage(
//                                       "${snapshot.data!.docs[index]["url"]}"),
//                                   fit: BoxFit.cover,
//                                 ),
//                                 border:
//                                     Border.all(width: 1, color: Colors.white),
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         }
//
//         return const Text("loading");
//       },
//     );
//   }
//
//   Widget events(width, height) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: Row(
//         children: [
//           Container(
//             height: 233,
//             width: width - 36,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: const AssetImage("assets/images/bk.png"),
//                 fit: BoxFit.cover,
//                 colorFilter: ColorFilter.mode(
//                     Colors.black.withOpacity(0.5), BlendMode.dstATop),
//               ),
//               color: const Color(0xff7c94b6),
//               border: Border.all(width: 1),
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: Stack(
//               children: [
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Image.asset("assets/images/vector.png"),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Image.asset(
//                     "assets/images/doctor.png",
//                     height: 195.99,
//                     width: 150.91,
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 15, top: 60),
//                       child: Column(
//                         children: [
//                           CustomText(
//                             text: "Get the Best \nmedcial Services",
//                             color: Colors.white,
//                             fontsize: 20,
//                             fontwight: FontWeight.bold,
//                           ),
//                           const SizedBox(height: 30),
//                           CustomText(
//                             text:
//                                 "We provide best quality medical \nservices without further cost.",
//                             color: Colors.white,
//                             fontsize: 11,
//                             fontwight: FontWeight.bold,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   String formattedDateDay = DateFormat.d().format(DateTime.now());
//   String formattedDate = DateFormat.E().format(DateTime.now());
//
//   Widget appointments(height) {
//     CollectionReference appointment =
//         FirebaseFirestore.instance.collection('appointment');
//     return StreamBuilder<QuerySnapshot>(
//       stream: appointment.snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Center(child: Text("ERROR"));
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         if (snapshot.hasData) {
//           return SizedBox(
//             height: height * 17.2 / 100,
//             child: ListView.separated(
//               separatorBuilder: (context, index) => const SizedBox(width: 6),
//               scrollDirection: Axis.horizontal,
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             height: 113,
//                             width: 251,
//                             decoration: BoxDecoration(
//                               gradient: const LinearGradient(
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 stops: [0.0, 0.7, 1],
//                                 colors: [
//                                   Color(0xff820B4B),
//                                   Color(0xff147294),
//                                   Colors.black,
//                                 ],
//                               ),
//                               border: Border.all(width: 1),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 20.0),
//                                   child: Container(
//                                     height: 70,
//                                     width: 55.29,
//                                     decoration: BoxDecoration(
//                                       gradient: const LinearGradient(
//                                         begin: Alignment.topCenter,
//                                         end: Alignment.bottomCenter,
//                                         stops: [0.0, 0.9, 1],
//                                         colors: [
//                                           Color(0xff820B4B),
//                                           Color(0xff147294),
//                                           Colors.black,
//                                         ],
//                                       ),
//                                       border: Border.all(
//                                           width: 0.5, color: Colors.white),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Center(
//                                       child: CustomText(
//                                         text:
//                                             "$formattedDateDay\n$formattedDate",
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.only(left: 15, top: 30),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       CustomText(
//                                         text: snapshot.data!.docs[index]
//                                             ["time"],
//                                         color: Colors.white,
//                                         fontsize: 10,
//                                       ),
//                                       const SizedBox(height: 3),
//                                       CustomText(
//                                         text: snapshot.data!.docs[index]
//                                             ["doctorId"],
//                                         color: Colors.white,
//                                         fontwight: FontWeight.bold,
//                                       ),
//                                       const SizedBox(height: 3),
//                                       CustomText(
//                                         text: snapshot.data!.docs[index]
//                                             ["insurance"],
//                                         color: Colors.white,
//                                         fontsize: 10,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           );
//         }
//
//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       bottomNavigationBar: const CustomBottomNavigationBar(),
//       backgroundColor: mainColor,
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 userData(width, height),
//                 searchBox(),
//                 SizedBox(height: height * 0.5 / 100),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8, right: 8),
//                   child: CustomText(
//                     text: "Services",
//                     color: Colors.white,
//                     fontsize: 22,
//                     fontwight: FontWeight.bold,
//                   ),
//                 ),
//                 services(height),
//                 events(width, height),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8, right: 8),
//                   child: CustomText(
//                     text: "Upcoming  Appointments",
//                     color: Colors.white,
//                     fontsize: 22,
//                     fontwight: FontWeight.bold,
//                   ),
//                 ),
//                 appointments(height),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
