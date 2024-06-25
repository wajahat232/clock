import 'package:alramingclock/Clock_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE ,d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if(!timezoneString.startsWith('-'))
      offsetSign = '+';
    print(timezoneString);


    return  Scaffold(
      backgroundColor:  Color(0xFF2D2F41),
     body: Row(
       children: [
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             buildTextButton( 'Clock' , 'assets/clock_icon.png'  ),
             buildTextButton( 'Alarm' , 'assets/alarm_icon.png'  ),
             buildTextButton( 'Timer' , 'assets/timer_icon.png'  ),
             buildTextButton( 'Stopwatch' , 'assets/stopwatch_icon.png'  ),
           ],
         ),
         VerticalDivider(color: Colors.white24 , width: 1,),
         Expanded(
           child: Container(
             padding: EdgeInsets.symmetric(horizontal: 32 , vertical: 64),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Flexible(
                     flex: 1,
                     fit: FlexFit.tight,
                     child: Text('Clock' , style: TextStyle(color: Colors.white, fontSize: 24),)),
                 Flexible(
                   flex: 2,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(formattedTime , style: TextStyle(color: Colors.white, fontSize: 64),),
                       Text(formattedDate , style: TextStyle(color: Colors.white, fontSize: 20),),
                     ],
                   ),
                 ),
                 Flexible(
                     flex: 5,
                     fit: FlexFit.tight,
                     child: Align(
                       alignment: Alignment.center,
                         child: ClockView(size : MediaQuery.of(context).size.height / 3.5))),
                 Flexible(
                   flex: 2,
                   fit: FlexFit.tight,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Timezone' , style: TextStyle(color: Colors.white, fontSize: 24),),
                       SizedBox(height: 16,),
                       Row(
                         children: [
                           Icon(Icons.language , color: Colors.white,),
                           SizedBox(width: 16,),
                           Text('UTC' + offsetSign + timezoneString , style: TextStyle(color: Colors.white, fontSize: 14),)
                         ],
                       )
                     ],
                   ),
                 ),

               ],
             ),
           ),
         ),
       ],
     ),
    );
  }

  Widget buildTextButton(String tittle , String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16 , horizontal: 0),
      child: TextButton(onPressed: (){},
                 child:Column(
                   children: [
                     Image.asset(image , scale: 1.5,),
                     SizedBox(height: 10,),
                     Text(tittle ?? '', style:
                     TextStyle(fontFamily: 'avenir',color: Colors.white , fontSize: 14),)
                   ],
                 ) ),
    );
  }
}
