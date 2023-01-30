import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {
bool _textFillFinish = false;
bool _captionLoad = false;
double _captionStartYPos = 0;
double _captionEndYPos = 330;
double _captionBottom = -50;
double _logoBottom = 330;
bool _isLoading = true;
bool _gvisible = false;
bool _ivisible = false;
bool _g2visible = false;
bool _avisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 3000), () {
      setState(() {
         _textFillFinish = true;
         _captionBottom = 300;
      });
    });
    Timer(Duration(milliseconds: 4100), () {
      setState(() {
         _captionLoad = true;
         _captionBottom = 570;
         _logoBottom = 600;
      });
    });

    Timer(Duration(milliseconds: 5600), () {
      setState(() {
        _isLoading = false;
      });
    });

     Timer(Duration(milliseconds: 200), () {
      setState(() {
       _gvisible = true;
      });
    });
    Timer(Duration(milliseconds: 1000), () {
      setState(() {
       _ivisible = true;
      });
    });
    Timer(Duration(milliseconds: 1800), () {
      setState(() {
       _g2visible = true;
      });
    });
    Timer(Duration(milliseconds: 2400), () {
      setState(() {
       _avisible = true;
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: 
      Stack(children: [
        AnimatedPositioned(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 800),
          left: 0,
          right: 0,
          bottom: _logoBottom,
          child: Center(child: 
          Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              
              Visibility(
                
                visible: _gvisible,
                child: textBox("G",40)
                ),
                Visibility(
                visible: _ivisible,
                child: textBox("I",20)
                ),
                Visibility(
                visible: _g2visible,
                child: textBox("G",40)
                ),
                Visibility(
                visible: _avisible,
                child: textBox("A",40)
                ),
            ],
          ), 
          )),
          AnimatedPositioned(
            curve: Curves.easeIn,
          duration: Duration(milliseconds: 800),
          left: 0,
          right: 0,
          bottom: _captionBottom,
          child: Caption(), 
          ),
          Positioned(
            child: !_isLoading? PageContent(): Container(),
            left: 0,
            right: 0,
            top:280 ,
            )
          
        
      ],)
    );
  }
}
SizedBox textBox(String text,double width){
    return SizedBox(
      
  width: width,
  child: TextLiquidFill(
      
      text: text,
      
          waveDuration: const Duration(milliseconds: 700),
          loadDuration: const Duration(milliseconds: 700),
        textAlign: TextAlign.left,
          waveColor: Colors.yellow.shade200,
          boxBackgroundColor: Color(0xFF2D2F41),
          textStyle: TextStyle(
            fontSize: 55.0,
            fontWeight: FontWeight.bold,
          ),
          boxHeight: 85,
    ),
  );
}

class Caption extends StatelessWidget {
  const Caption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0),
      width: 250,
      height: 50,
      child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Powered by",style: TextStyle(color: Colors.white,fontSize: 5),textAlign: TextAlign.center,),
              Icon(Icons.man_outlined,color: Colors.white,),
              Container(
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("GOODWILL",style: TextStyle(color: Colors.white,fontSize: 15),textAlign: TextAlign.end,),
                    Text("EQUITY | COMMODITY | CURRENCY",style: TextStyle(color: Colors.white,fontSize: 5),)
        
                  ],
                ),
              )
            ],
          )
        
      
    );
  }
}

class PageContent extends StatelessWidget {
  // const pageContent({
  //   Key? key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2+100,
      child: Column(
       
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children:  <Widget>[
        
//         SizedBox(
//   width: 250.0,
//   child: TextLiquidFill(
      
//     text: 'GIGA',
//         waveDuration: const Duration(milliseconds: 700),
//         loadDuration: const Duration(milliseconds: 700),
        
//         waveColor: Colors.yellow.shade200,
//         boxBackgroundColor: Colors.black,
//         textStyle: TextStyle(
//           fontSize: 50.0,
//           fontWeight: FontWeight.bold,
//         ),
//   ),
// ),
      
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: TextField(
         
           decoration: InputDecoration(
             enabledBorder: UnderlineInputBorder(      
               borderSide: BorderSide(color: Colors.transparent),   
               ),  
       focusedBorder: UnderlineInputBorder(
               borderSide: BorderSide(color: Colors.transparent),
            ),  
             
             labelText: 'User ID',
             labelStyle: TextStyle(color: Colors.grey)
           ),
         ),
      ),
       Padding(
         padding: const EdgeInsets.all(20.0),
         child: TextField(
           decoration: InputDecoration(
             enabledBorder: UnderlineInputBorder(      
               borderSide: BorderSide(color: Colors.transparent),   
               ),  
       focusedBorder: UnderlineInputBorder(
               borderSide: BorderSide(color: Colors.transparent),
            ),  
             labelText: 'Password',
             labelStyle: TextStyle(color: Colors.grey),
             suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye),color: Colors.yellow.shade200,)
           ),
           
         ),
       ),
       
         Container(
           padding: EdgeInsets.only(right: 15),
           child: Align(
             alignment: Alignment.centerRight,
             child: TextButton(
              
               onPressed: (){}, 
             child: const Text('Forgot Password?',
             style: TextStyle(
               color: Colors.white
             ),
             ),
             
             ),
           ),
         ),
         
           Padding(
             padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
             child: InkWell(
         
         onTap: (){},
         child: Container(
          //width: 100.0,
              height: 50.0,
              decoration: BoxDecoration(
              color: Colors.transparent,
             border: Border.all(color: Colors.yellow.shade200, width: 2.0),
             borderRadius: BorderRadius.circular(10.0),
         ),
         child: Center(child: Text('Get OTP', style: TextStyle(fontSize: 18.0, color: Colors.yellow.shade200),),),
  ),
),
           ),
         Padding(
             padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
             child: InkWell(
         
         onTap: (){},
         child: Container(
          //width: 100.0,
              height: 50.0,
              decoration: BoxDecoration(
              color: Colors.transparent,
             border: Border.all(color: Colors.white, width: 2.0),
             borderRadius: BorderRadius.circular(10.0),
             ),
         child: Center(child: Text('Open an Account', style: TextStyle(fontSize: 18.0, color: Colors.white),),),
           ),
),
           ),
         Container(
           padding: EdgeInsets.only(top: 30,bottom: 10),
           child: Column(children: <Widget>[
             
             Icon(Icons.videogame_asset,color: Colors.white,),
             SizedBox(height: 10,),
             Text("Virtual Trading",style: TextStyle(color: Colors.white),)
           ],)
         ),

         Container(
           padding: EdgeInsets.only(top: 30,bottom: 10),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
               Text("Membership Details",style: TextStyle(color: Colors.yellow.shade200)),
               Text("Real Time Support",style: TextStyle(color: Colors.yellow.shade200))
             ],
           ),
         )

       
       
        ]),
    );
  }

   
  
}
