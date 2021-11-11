// ignore_for_file: prefer_const_constructors

import 'package:chesss_watch/ChessTimer.dart';
import 'package:chesss_watch/Custom/ClockCard.dart';
import 'package:chesss_watch/Custom/TextFeild.dart';
import 'package:chesss_watch/Custom/Timer.dart';
import 'package:chesss_watch/Model/Chess.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess Watch',
      
      home: MyHomePage(title: 'Chess Watch',),
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  late int start;
  late List<ChessPlayer> lst;
  TimerStyle _timerStyle = TimerStyle.ring;
  TimerProgressTextCountDirection _progressTextCountDirection = TimerProgressTextCountDirection.count_down;


  @override
  void initState() {
    // initialize timercontroller
    lst = ChessBoard;
    start = 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: <Widget>[
          ClockCard(
            chessSide: ChessBoard[0],
            start: start == 0,
            timerStyle: _timerStyle,
            onTapClock: onTapStart,
            progressTextCountDirection: _progressTextCountDirection,
          ),
          
          ClockCard(
            chessSide: ChessBoard[1],
            start: start == 1 ,
            timerStyle: _timerStyle,
            onTapClock: onTapStart,
            progressTextCountDirection: _progressTextCountDirection,
          ),
          
          

          ],
      ),
    );
  }

  void onTapStart(){
    setState(() {
      start = start == 0 ? 1: 0;
    });
  }


  void _setCountDirection(TimerProgressTextCountDirection countDirection) {
    setState(() {
      _progressTextCountDirection = countDirection;
    });
  }

}

// class ClockScreenCard extends StatefulWidget  with SingleTickerProviderStateMixin {
//    MyHomePage({Key? key,required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

//   late bool start;

//   late TimerController _timerController1;
//   late TimerController _timerController2;
//   TimerStyle _timerStyle = TimerStyle.ring;
//   TimerProgressTextCountDirection _progressTextCountDirection = TimerProgressTextCountDirection.count_down;


//   @override
//   void initState() {
//     // initialize timercontroller
//     _timerController1 = TimerController(this);
//     _timerController2 = TimerController(this);
//     start = false;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return null;
//   }
// }
// class StartScreen extends StatefulWidget {
//   const StartScreen({ Key? key }) : super(key: key);

//   @override
//   _StartScreenState createState() => _StartScreenState();
// }

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
