// import '../custom_widgets/custom_text.dart';
// import 'appointment_screen.dart';
// import 'detailes.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../../core/util/resources/colors.dart';
// import '../custom_widgets/custom_button.dart';
//
// class ServiceView extends StatelessWidget {
//   final QueryDocumentSnapshot<Object?>? model;
//
//   const ServiceView({super.key, this.model});
//
//   Widget data(height, snapshot, index) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: 80,
//           width: 100,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: NetworkImage(
//                 "${snapshot.data!.docs[index]["url"]}",
//               ),
//               fit: BoxFit.cover,
//             ),
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 15.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomText(
//                 text: "${snapshot.data!.docs[index]["name"]}",
//                 color: Colors.white,
//                 fontsize: 15,
//                 fontwight: FontWeight.bold,
//               ),
//               const SizedBox(height: 6),
//               CustomText(
//                 text: "${snapshot.data!.docs[index]["degree"]}",
//                 color: Colors.white,
//                 fontsize: 12,
//               ),
//               const SizedBox(height: 6),
//               CustomText(
//                 text: "${snapshot.data!.docs[index]["major"]}",
//                 color: Colors.white,
//                 fontsize: 12,
//               ),
//               const SizedBox(height: 6),
//               CustomText(
//                 text: "${snapshot.data!.docs[index]["holdes"]}",
//                 color: Colors.white,
//                 fontsize: 12,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buttons(width, context, snapshot, index) {
//     return Container(
//       width: width,
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.all(
//           Radius.circular(10),
//         ),
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           stops: [0.1, 0.9],
//           colors: [
//             Color(0xff820B4B),
//             Color(0xff147294),
//           ],
//         ),
//       ),
//       child: CustomButton(
//         onpressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (_) => AppointmentScreen(
//                       model: snapshot.data!.docs[index],
//                     )),
//           );
//         },
//         size: Size(width / 2 - 39, 35),
//         child: const Text(
//           "Appointment",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     CollectionReference service =
//         FirebaseFirestore.instance.collection('service');
//     return Scaffold(
//       backgroundColor: mainColor,
//       appBar: AppBar(
//         title: Text(
//           model!.get("type"),
//         ),
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topRight,
//               end: Alignment.bottomLeft,
//               stops: [0.0, 0.7],
//               colors: [
//                 Color(0xff820B4B),
//                 Color(0xff147294),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//           stream:
//               service.where("type", isEqualTo: model!.get("type")).snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return const Center(child: Text("ERROR"));
//             }
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             if (snapshot.hasData) {
//               if (model!.get("type") == "doctor") {
//                 return GridView.builder(
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 1,
//                       mainAxisExtent: 205,
//                     ),
//                     scrollDirection: Axis.vertical,
//                     itemCount: snapshot.data!.docs.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: const BorderRadius.all(
//                               Radius.circular(10.0),
//                             ),
//                             border: Border.all(width: 1, color: Colors.white),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(15.0),
//                             child: Column(
//                               children: [
//                                 data(height, snapshot, index),
//                                 const SizedBox(height: 15),
//                                 buttons(width, context, snapshot, index),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     });
//               } else {
//                 return GridView.builder(
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 1,
//                       mainAxisSpacing: 0,
//                       childAspectRatio: 2,
//                     ),
//                     shrinkWrap: true,
//                     scrollDirection: Axis.vertical,
//                     itemCount: snapshot.data!.docs.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => Detailes(
//                                       model: snapshot.data!.docs[index],
//                                     )),
//                           );
//                         },
//                         child: Column(
//                           children: [
//                             const SizedBox(height: 15),
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15.0, right: 15.0),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: const BorderRadius.all(
//                                       Radius.circular(10.0),
//                                     ),
//                                     image: DecorationImage(
//                                       image: NetworkImage(
//                                         "${snapshot.data!.docs[index]["url"]}",
//                                       ),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         // Padding(
//                         //   padding: const EdgeInsets.only(
//                         //     left: 15.0,
//                         //     right: 15.0,
//                         //   ),
//                         //   child: Container(
//                         //     height: 175,
//                         //     decoration: BoxDecoration(
//                         //       borderRadius: const BorderRadius.all(
//                         //         Radius.circular(10.0),
//                         //       ),
//                         //       image: DecorationImage(
//                         //         image: NetworkImage(
//                         //           "${snapshot.data!.docs[index]["url"]}",
//                         //         ),
//                         //         fit: BoxFit.contain,
//                         //       ),
//                         //     ),
//                         //   ),
//                         // ),
//                       );
//                     });
//               }
//             }
//             return const Center(child: CircularProgressIndicator());
//           }),
//     );
//   }
// }
