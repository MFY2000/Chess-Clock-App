
// ignore_for_file: file_names

import 'package:flutter/material.dart';


// class _StartScreenState extends State<StartScreen> {
//   TextEditingController player1 = TextEditingController();
//   TextEditingController player2 = TextEditingController();

//   late var width, height;

//   late bool startbtn = false;
  
//   onChangeText(context){
//     List<String> names = [player1.value.text, player2.value.text];


//     if(!(names.any((element) => element.isEmpty))){

//       ChessBoard[1].name = names[0];
//       ChessBoard[0].name = names[1];

//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => (ChessTimer())),
//       );

//     }
//     else{
//       if(names[0].isEmpty) {
//         player1.selection;
//       }
//       else{
//         player2.selection;
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {

//     width = MediaQuery.of(context).size.width;
//     height = MediaQuery.of(context).size.height;
    
//     return Scaffold(
      
//       // backgroundColor: const Color(0xffffffff),
//       body: Container(
//         margin: EdgeInsets.zero,
//         padding: EdgeInsets.zero,

//         width: width,
//         height: height,

//         decoration: BoxDecoration(
//           image: DecorationImage(image: AssetImage("assets/images/bg.png"), fit: BoxFit.fill),
//         ),

//         child: Column(
//           children: [
//             SizedBox(
//               height: (height * 0.20),  
//             ),
//             // Adobe XD layer: 'Player 2' (group)
//             TextFeild_(name: 'Player 1 name', color: Colors.black, control: player1),

//             SizedBox(
//               height: (height * 0.20),  
//             ),
    
//             TextButton(      
//               onPressed: () => {onChangeText(context)},
//               // autofocus: false,
//               child: Container(
//                 height: (height * 0.045),
//                 width: (width * 0.25),
//                 alignment: Alignment.center,
                
//                 child: Text( 'Start',
//                   style: TextStyle(
//                     fontFamily: 'Times New Roman', 
//                     color: Color(0xffffffff),
//                     fontWeight: FontWeight.bold,
//                   ),
//                ),

//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100),
//                     color: const Color(0xff00ff08),
//                 ),
//               ),
//             ),


//             SizedBox(
//               height: (height * 0.20),  
//             ),

//             TextFeild_(name: 'Player 2 name', color: Colors.white, control: player2),

//             SizedBox(
//               height: (height * 0.20),  
//             ),
    
    
//           ],
//         ),
//       ),
//     );
//   }
// }