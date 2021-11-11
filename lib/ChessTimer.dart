// // ignore_for_file: file_names

// import 'package:chesss_watch/Custom/Clock.dart';
// import 'package:chesss_watch/Model/Chess.dart';
// import 'package:flutter/material.dart';

// class ChessTimer extends StatefulWidget {

//   const ChessTimer({Key? key}) : super(key: key);

//   @override
//   _ChessTimerState createState() => _ChessTimerState();
// }

// class _ChessTimerState extends State<ChessTimer> {
//   late var width, height;

//   @override
//   Widget build(BuildContext context) {
//     width = MediaQuery.of(context).size.width;
//     height = MediaQuery.of(context).size.height;
    
//     print(ChessBoard[0].name);
    
//     return Scaffold(

//         // backgroundColor: const Color(0xffffffff),
//         body: Container(
//             margin: EdgeInsets.zero,
//             padding: EdgeInsets.zero,
//             width: width,
//             height: height,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("assets/images/bg.png"), fit: BoxFit.fill),
//             ),
//             child: Column(
//               children: [
                
//                 SizedBox(
//                   height: (height * 0.1),
//                   child: Center(child: Text(ChessBoard[0].name, style: TextStyle(color: ChessBoard[0].color),),),
//                 ),

//                 ClockCard( index: 0),


//                 SizedBox(
//                   height: (height * 0.1),  
//                 ),
    
//                 TextButton(      
//                   onPressed: ()=>{},
//                   autofocus: false,
//                   child: Container(
//                     height: (height * 0.045),
//                     width: (width * 0.25),
//                     alignment: Alignment.center,
                    
//                     child: const Text( 'Stop',
//                     style: TextStyle(
//                       fontFamily: 'Times New Roman', 
//                       color: Color(0xffffffff),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100),
//                         color: Colors.red,
//                     ),
//                   ),
//                 ),
        
//                 SizedBox(
//                   height: (height * 0.1),
//                   child: Center(child: Text(ChessBoard[1].name, style: TextStyle(color: ChessBoard[1].color),),),
//                 ),

//                 ClockCard(index: 1),

//               ],
//             )));
//   }
// }
