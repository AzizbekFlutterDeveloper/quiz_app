// import 'package:app/core/clip_consts.dart';
// import 'package:app/core/contanier_consts.dart';
// import 'package:app/core/data.dart';
// import 'package:flutter/material.dart';

// class AsosiyPAge extends StatelessWidget {
//   const AsosiyPAge({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Column(
//         children: [
//           ClipPath(
//             child: Container(
//               height: size.height * 0.15,
//               width: size.width,
//               color: Colors.green,
//             ),
//             clipper: CustomClipPath(),
//           ),
//           SizedBox(
//             height: size.height * 0.7,
//             child: GridView.builder(
//               padding: EdgeInsets.only(
//                 top: size.height * 0.01,
//               ),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2, mainAxisExtent: size.height * 0.22),
//               itemBuilder: (context, index) {
//                 return InkWell(
//                   child: Container(
//                     margin: EdgeInsets.only(
//                       left: size.width * 0.03,
//                       right: size.width * 0.03,
//                       top: size.height * 0.02,
//                     ),
//                     decoration: BoxDecoration(
//                       borderRadius: MyContanier.myBorder,
//                       color: Colors.amber,
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Colors.grey,
//                           offset: Offset(4.0, 2.0),
//                           blurRadius: 6.0,
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: size.height * 0.13,
//                           width: size.height * 0.13,
//                           child: Image.network(bolim[index]['img'],fit: BoxFit.cover,),
//                         ),
//                         SizedBox(
//                           height: size.height * 0.06,
//                           width: size.width,
//                           child: Center(child: Text(bolim[index]['name'],style: TextStyle(fontSize: size.width * 0.045,),),),
//                         ),
//                       ],
//                     ),
//                   ),
//                   onTap: (){
//                     Navigator.pushNamed(context, '/home');
//                   },
//                 );
//               },
//               itemCount: 5,
//             ),
//           ),
//           RotatedBox(
//             quarterTurns: 6,
//             child: ClipPath(
//               child: Container(
//                 height: size.height * 0.15,
//                 width: size.width,
//                 color: Colors.green,
//               ),
//               clipper: CustomClipPath(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
