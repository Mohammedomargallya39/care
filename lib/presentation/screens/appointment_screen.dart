// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:care/presentation/custom_widgets/custom_text.dart';
// import 'package:care/presentation/screens/home_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// import '../../core/util/resources/colors.dart';
// import '../../constants/strings.dart';
// import '../../model/appointment_model.dart';
// import '../custom_widgets/custom_button.dart';
//
// class AppointmentScreen extends StatefulWidget {
//   QueryDocumentSnapshot<Object?>? model;
//
//   AppointmentScreen({
//     Key? key,
//     this.model,
//   }) : super(key: key);
//
//   @override
//   State<AppointmentScreen> createState() => _AppointmentScreenState();
// }
//
// class _AppointmentScreenState extends State<AppointmentScreen> {
//   var currentUserId = FirebaseAuth.instance.currentUser!.uid;
//
//   String? company;
//
//   String? time;
//
//   String formattedDate = DateFormat.yMMMEd().format(DateTime.now());
//
//   bool _hasBeenPressed = false;
//   int? num;
//
//   Future<void> _showMyDialog() async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Appointment'),
//           content: Text("Are you sure you want to book at $time ?"),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('yes'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Widget timeButtons(snapshot, width, height) {
//     return Container(
//       margin: EdgeInsets.only(bottom: height * 5 / 100),
//       child: Expanded(
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     time = snapshot.data!.docs[0]["time"];
//                     setState(() {
//                       num = 0;
//                     });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: num == 0 ? Colors.blue : Colors.white,
//                       border: Border.all(
//                         width: 1,
//                         color: num == 0 ? Colors.white : Colors.blue,
//                       ),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(30),
//                       ),
//                     ),
//                     child: CustomButton(
//                       child: Text(
//                         "${snapshot.data!.docs[0]["time"]}",
//                         style: TextStyle(
//                             color: num == 0 ? Colors.white : Colors.blue,
//                             fontSize: 17),
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     time = snapshot.data!.docs[1]["time"];
//                     setState(() {
//                       num = 1;
//                     });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: num == 1 ? Colors.blue : Colors.white,
//                       border: Border.all(
//                         width: 1,
//                         color: num == 1 ? Colors.white : Colors.blue,
//                       ),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(30),
//                       ),
//                     ),
//                     child: CustomButton(
//                       child: Text(
//                         "${snapshot.data!.docs[1]["time"]}",
//                         style: TextStyle(
//                             color: num == 1 ? Colors.white : Colors.blue,
//                             fontSize: 17),
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     time = snapshot.data!.docs[2]["time"];
//                     setState(() {
//                       num = 2;
//                     });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: num == 2 ? Colors.blue : Colors.white,
//                       border: Border.all(
//                         width: 1,
//                         color: num == 2 ? Colors.white : Colors.blue,
//                       ),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(30),
//                       ),
//                     ),
//                     child: CustomButton(
//                       child: Text(
//                         "${snapshot.data!.docs[2]["time"]}",
//                         style: TextStyle(
//                             color: num == 2 ? Colors.white : Colors.blue,
//                             fontSize: 17),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: height * 2 / 100),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     time = snapshot.data!.docs[3]["time"];
//                     setState(() {
//                       num = 3;
//                     });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: num == 3 ? Colors.blue : Colors.white,
//                       border: Border.all(
//                         width: 1,
//                         color: num == 3 ? Colors.white : Colors.blue,
//                       ),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(30),
//                       ),
//                     ),
//                     child: CustomButton(
//                       child: Text(
//                         "${snapshot.data!.docs[3]["time"]}",
//                         style: TextStyle(
//                             color: num == 3 ? Colors.white : Colors.blue,
//                             fontSize: 17),
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     time = snapshot.data!.docs[4]["time"];
//                     setState(() {
//                       num = 4;
//                     });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: num == 4 ? Colors.blue : Colors.white,
//                       border: Border.all(
//                         width: 1,
//                         color: num == 4 ? Colors.white : Colors.blue,
//                       ),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(30),
//                       ),
//                     ),
//                     child: CustomButton(
//                       child: Text(
//                         "${snapshot.data!.docs[4]["time"]}",
//                         style: TextStyle(
//                             color: num == 4 ? Colors.white : Colors.blue,
//                             fontSize: 17),
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     time = snapshot.data!.docs[5]["time"];
//                     setState(() {
//                       num = 5;
//                     });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: num == 5 ? Colors.blue : Colors.white,
//                       border: Border.all(
//                         width: 1,
//                         color: num == 5 ? Colors.white : Colors.blue,
//                       ),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(30),
//                       ),
//                     ),
//                     child: CustomButton(
//                       child: Text(
//                         "${snapshot.data!.docs[5]["time"]}",
//                         style: TextStyle(
//                             color: num == 5 ? Colors.white : Colors.blue,
//                             fontSize: 17),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: height * 2 / 100),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     time = snapshot.data!.docs[6]["time"];
//                     setState(() {
//                       num = 6;
//                     });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: num == 6 ? Colors.blue : Colors.white,
//                       border: Border.all(
//                         width: 1,
//                         color: num == 6 ? Colors.white : Colors.blue,
//                       ),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(30),
//                       ),
//                     ),
//                     child: CustomButton(
//                       child: Text(
//                         "${snapshot.data!.docs[6]["time"]}",
//                         style: TextStyle(
//                             color: num == 6 ? Colors.white : Colors.blue,
//                             fontSize: 17),
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     time = snapshot.data!.docs[7]["time"];
//                     setState(() {
//                       num = 7;
//                     });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: num == 7 ? Colors.blue : Colors.white,
//                       border: Border.all(
//                         width: 1,
//                         color: num == 7 ? Colors.white : Colors.blue,
//                       ),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(30),
//                       ),
//                     ),
//                     child: CustomButton(
//                       child: Text(
//                         "${snapshot.data!.docs[7]["time"]}",
//                         style: TextStyle(
//                             color: num == 7 ? Colors.white : Colors.blue,
//                             fontSize: 17),
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     time = snapshot.data!.docs[8]["time"];
//                     setState(() {
//                       num = 8;
//                     });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: num == 8 ? Colors.blue : Colors.white,
//                       border: Border.all(
//                         width: 1,
//                         color: num == 8 ? Colors.white : Colors.blue,
//                       ),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(30),
//                       ),
//                     ),
//                     child: CustomButton(
//                       child: Text(
//                         "${snapshot.data!.docs[8]["time"]}",
//                         style: TextStyle(
//                             color: num == 8 ? Colors.white : Colors.blue,
//                             fontSize: 17),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: height * 2 / 100),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     time = snapshot.data!.docs[9]["time"];
//                     setState(() {
//                       num = 9;
//                     });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: num == 9 ? Colors.blue : Colors.white,
//                       border: Border.all(
//                         width: 1,
//                         color: num == 9 ? Colors.white : Colors.blue,
//                       ),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(30),
//                       ),
//                     ),
//                     child: CustomButton(
//                       child: Text(
//                         "${snapshot.data!.docs[9]["time"]}",
//                         style: TextStyle(
//                             color: num == 9 ? Colors.white : Colors.blue,
//                             fontSize: 17),
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     time = snapshot.data!.docs[10]["time"];
//                     setState(() {
//                       num = 10;
//                     });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: num == 10 ? Colors.blue : Colors.white,
//                       border: Border.all(
//                         width: 1,
//                         color: num == 10 ? Colors.white : Colors.blue,
//                       ),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(30),
//                       ),
//                     ),
//                     child: CustomButton(
//                       child: Text(
//                         "${snapshot.data!.docs[10]["time"]}",
//                         style: TextStyle(
//                             color: num == 10 ? Colors.white : Colors.blue,
//                             fontSize: 17),
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     time = snapshot.data!.docs[11]["time"];
//                     setState(() {
//                       num = 11;
//                     });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: num == 11 ? Colors.blue : Colors.white,
//                       border: Border.all(
//                         width: 1,
//                         color: num == 11 ? Colors.white : Colors.blue,
//                       ),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(30),
//                       ),
//                     ),
//                     child: CustomButton(
//                       child: Text(
//                         "${snapshot.data!.docs[11]["time"]}",
//                         style: TextStyle(
//                             color: num == 11 ? Colors.white : Colors.blue,
//                             fontSize: 17),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget insuranceCompanies() {
//     return Container(
//       padding: const EdgeInsets.only(left: 15),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(width: 1),
//           borderRadius: const BorderRadius.all(Radius.circular(15))),
//       child: DropdownSearch<String>(
//         dropdownButtonProps: const DropdownButtonProps(color: Colors.blue),
//         validator: (value) {
//           if (value!.isEmpty) {
//             return "required field";
//           }
//         },
//         popupProps: PopupProps.menu(
//           showSearchBox: false,
//           showSelectedItems: true,
//           disabledItemFn: (String s) => s.startsWith('I'),
//         ),
//         items: companies,
//         dropdownDecoratorProps: const DropDownDecoratorProps(
//           dropdownSearchDecoration: InputDecoration(
//             enabledBorder: UnderlineInputBorder(
//               borderSide: BorderSide(color: Colors.transparent, width: 1),
//             ),
//             labelText: "Insurance companies",
//             labelStyle: TextStyle(color: Colors.blue),
//             hintText: "Choose your insurance companies",
//           ),
//         ),
//         onChanged: (value) {
//           company = value;
//         },
//       ),
//     );
//   }
//
//   Future<void> succsess() async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Done'),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('ok'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Widget nextButton(width, context) {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.bottomRight,
//           end: Alignment.topLeft,
//           stops: [0.0, 0.9],
//           colors: [
//             Color(0xff820B4B),
//             Color(0xff147294),
//           ],
//         ),
//         borderRadius: BorderRadius.all(
//           Radius.circular(30),
//         ),
//       ),
//       child: CustomButton(
//         onpressed: () async {
//           if (time != null) {
//             // await Firestore().appointment(ApointmentModel(
//             //   userId: currentUserId,
//             //   time: time,
//             //   insurance: company ?? "Don't have",
//             //   doctorId: widget.model!.get("name"),
//             // ));
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (_) => HomeScreen()),
//             );
//             succsess();
//           } else {
//             return;
//           }
//         },
//         size: Size(width, 65),
//         child: const Text(
//           "Next",
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     CollectionReference time = FirebaseFirestore.instance.collection('time');
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: mainColor,
//         elevation: 0.0,
//         title: const Text("Book Appointment"),
//       ),
//       backgroundColor: mainColor,
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: StreamBuilder<QuerySnapshot>(
//             stream: time.snapshots(),
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 return const Center(child: Text("ERROR"));
//               }
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//               if (snapshot.hasData) {
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CustomText(
//                       color: Colors.white,
//                       text: formattedDate.toString(),
//                     ),
//                     SizedBox(height: height * 3 / 100),
//                     timeButtons(snapshot, width, height),
//                     insuranceCompanies(),
//                     const SizedBox(height: 30),
//                     nextButton(width, context),
//                     const SizedBox(height: 30),
//                     Align(
//                       alignment: Alignment.center,
//                       child: Image.asset(
//                         "assets/images/logo.png",
//                         scale: 2,
//                       ),
//                     ),
//                   ],
//                 );
//               }
//               return const Center(child: CircularProgressIndicator());
//             }),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//       // GridView.builder(
//       //       shrinkWrap: true,
//       //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//       //         crossAxisCount: 3,
//       //         mainAxisSpacing: 10, // space between each row
//       //         mainAxisExtent: 40,
//       //         crossAxisSpacing: 10, // space between each column
//       //         childAspectRatio: 2 / 3, // width to height ratio of each item
//       //       ),
//       //       scrollDirection: Axis.vertical,
//       //       itemCount: snapshot.data!.docs.length,
//       //       itemBuilder: (BuildContext context, int index) {
//       //         return GestureDetector(
//       //           onTap: () {
//       //             time = snapshot.data!.docs[index]["time"];
//       //             _showMyDialog();
//       //           },
//       //           child: Container(
//       //             decoration: BoxDecoration(
//       //               color: Colors.white,
//       //               border: Border.all(
//       //                 width: 1,
//       //                 color: _hasBeenPressed ? Colors.red : Colors.blue,
//       //               ),
//       //               borderRadius: const BorderRadius.all(
//       //                 Radius.circular(30),
//       //               ),
//       //             ),
//       //             child: CustomButton(
//       //               child: Text(
//       //                 "${snapshot.data!.docs[index]["time"]}",
//       //                 style: const TextStyle(color: Colors.blue, fontSize: 17),
//       //               ),
//       //             ),
//       //           ),
//       //         );
//       //       }),
//