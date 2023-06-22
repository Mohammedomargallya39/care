// import '../../core/util/resources/colors.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
//
// import '../custom_widgets/custom_button.dart';
// import '../custom_widgets/custom_text.dart';
//
// class Detailes extends StatelessWidget {
//   final QueryDocumentSnapshot<Object?>? model;
//   const Detailes({super.key, this.model});
//
//   Widget? detailes(height, width) {
//     if (model!.get("type") == "pharmacies" || model!.get("type") == "lab") {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           SizedBox(height: height * 5 / 100),
//           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//             CustomText(
//               text: model!.get("type"),
//               color: Colors.white,
//               fontsize: 25,
//               fontwight: FontWeight.bold,
//             ),
//             const Text(""),
//             Image.asset(
//               "assets/images/logo.png",
//               scale: 2.5,
//             )
//           ]),
//           SizedBox(height: height * 5 / 100),
//           CustomText(
//             text: "العنوان",
//             color: Colors.white,
//             fontsize: 25,
//             fontwight: FontWeight.bold,
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: CustomText(
//               text: model!.get("address"),
//               color: Colors.white,
//               fontsize: 25,
//               fontwight: FontWeight.bold,
//             ),
//           ),
//           // #######################
//           CustomText(
//             text: "المنطقة",
//             color: Colors.white,
//             fontsize: 25,
//             fontwight: FontWeight.bold,
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: CustomText(
//               text: model!.get("region"),
//               color: Colors.white,
//               fontsize: 25,
//               fontwight: FontWeight.bold,
//             ),
//           ),
//           // #######################
//           CustomText(
//             text: "المحافظة",
//             color: Colors.white,
//             fontsize: 25,
//             fontwight: FontWeight.bold,
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: CustomText(
//               text: model!.get("Governorate"),
//               color: Colors.white,
//               fontsize: 25,
//               fontwight: FontWeight.bold,
//             ),
//           ),
//           // #######################
//           CustomText(
//             text: "الخط الساخن",
//             color: Colors.white,
//             fontsize: 25,
//             fontwight: FontWeight.bold,
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: CustomText(
//               text: model!.get("hotline"),
//               color: Colors.white,
//               fontsize: 25,
//               fontwight: FontWeight.bold,
//             ),
//           ),
//           // #######################
//           SizedBox(height: height * 5 / 100),
//           Container(
//             height: height * 20 / 100,
//             width: width - 30,
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(10),
//               ),
//               image: DecorationImage(
//                 image: NetworkImage(
//                   model!.get("url"),
//                 ),
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//         ],
//       );
//     } else if (model!.get("type") == "campaigns") {
//       return Column(
//         children: [
//           SizedBox(height: height * 5 / 100),
//           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//             CustomText(
//               text: model!.get("disease"),
//               color: Colors.white,
//               fontsize: 25,
//               fontwight: FontWeight.bold,
//             ),
//             const Text(""),
//             Image.asset(
//               "assets/images/logo.png",
//               scale: 2.5,
//             )
//           ]),
//           SizedBox(height: height * 2 / 100),
//           Container(
//             height: height * 20 / 100,
//             width: width - 30,
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(10),
//               ),
//               image: DecorationImage(
//                 image: NetworkImage(
//                   model!.get("url"),
//                 ),
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//           SizedBox(height: height * 1 / 100),
//           CustomText(
//             text: "كيفيه الوقاية من هذا المرض ؟",
//             color: Colors.white,
//             fontsize: 25,
//             fontwight: FontWeight.bold,
//           ),
//           SizedBox(height: height * 1 / 100),
//           CustomText(
//             text: "غسل اليدين بالماء والصابون جيدا",
//             color: Colors.white,
//             fontsize: 17,
//           ),
//           SizedBox(height: height * 1 / 100),
//           CustomText(
//             text: "تجنب لمس الانف والعينين باستخدام اليدين",
//             color: Colors.white,
//             fontsize: 17,
//           ),
//           SizedBox(height: height * 1 / 100),
//           CustomText(
//             text: "تجنب الاشخاص المصابين وعدم التعامل معهم عن قرب ",
//             color: Colors.white,
//             fontsize: 17,
//           ),
//           SizedBox(height: height * 1 / 100),
//         ],
//       );
//     } else if (model!.get("type") == "donations") {
//       return Column(
//         children: [
//           SizedBox(height: height * 5 / 100),
//           CustomText(
//             text: model!.get("name"),
//             color: Colors.white,
//             fontsize: 25,
//             fontwight: FontWeight.bold,
//           ),
//           SizedBox(height: height * 5 / 100),
//           Container(
//             height: height * 20 / 100,
//             width: width - 30,
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(10),
//               ),
//               image: DecorationImage(
//                 image: NetworkImage(
//                   model!.get("url"),
//                 ),
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//           SizedBox(height: height * 1 / 100),
//           CustomText(
//             text: "رقم التبرع",
//             color: Colors.white,
//             fontsize: 25,
//             fontwight: FontWeight.bold,
//           ),
//           SizedBox(height: height * 2 / 100),
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.bottomRight,
//                 end: Alignment.topLeft,
//                 stops: [0.0, 0.9],
//                 colors: [
//                   Color(0xff820B4B),
//                   Color(0xff147294),
//                 ],
//               ),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(30),
//               ),
//             ),
//             child: CustomButton(
//               size: Size(width - 30, 65),
//               child: Text(
//                 model!.get("number"),
//                 style: const TextStyle(color: Colors.white, fontSize: 20),
//               ),
//             ),
//           ),
//           SizedBox(height: height * 7 / 100),
//           Image.asset(
//             "assets/images/logo.png",
//             scale: 2,
//           ),
//         ],
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: mainColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: SizedBox(
//               width: width - 30,
//               child: detailes(height, width),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
