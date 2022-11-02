import 'dart:ui';
import 'package:flutter/material.dart';


class BottomSheetBackground extends StatefulWidget {
  BottomSheetBackground({Key? key, required this.body, required this.background, required this.visibleCircle, required this.circleEvatar, }) : super(key: key);


  final Widget body;
  final Widget background;
  final bool visibleCircle;
  //static Color? colorCircle;
   Widget circleEvatar = Image.asset(
      "images/null.png",
      fit: BoxFit.cover,
    );

  @override
  _BottomSheetState createState() => _BottomSheetState();

}

class _BottomSheetState extends State<BottomSheetBackground> {
  refresh() {
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width /1.04;
    double height = MediaQuery.of(context).size.height /4.8;
    return  SizedBox(
      width:  width,
      height:  height,
      child:Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            child: Stack(
                alignment: Alignment.center,
                children: [
                  //back
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 20.0,
                        sigmaY: 20.0,
                      ),
                      child:  SizedBox(
                        width:  width,
                        height:  height,
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.5),
                            ),
                            child: widget.background

                        ),

                      ),
                    ),
                  ),

                  //middle
                  Positioned(
                    top: MediaQuery.of(context).viewInsets.top + 5,//10,//MediaQuery.of(context).size.height * 0.500,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 5,

                    //  left: 20,
                    //  right: 30,
                    child:
                    SizedBox(
                      width: MediaQuery.of(context).size.width /1.2,
                      child:  widget.body,
                    ),

                  ),

                ]
            ),

          ),

          //Circle
          Visibility(
            visible: widget.visibleCircle,
            child: Positioned(
                bottom: MediaQuery.of(context).viewInsets.bottom + 90,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child:   Container(
                    width: MediaQuery.of(context).size.width /3.9,
                    height: MediaQuery.of(context).size.height /3.9,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white),
                    child: Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(50),
                            child:  Padding(
                              padding: const EdgeInsets.all(1.0),
                              child:    Container(
                                width: MediaQuery.of(context).size.width /3.9,
                                height: MediaQuery.of(context).size.height /3.9,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:  const Color(0xff455170).withOpacity(0.8),),
                                child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(50),
                                      child: widget.circleEvatar
                                    ) ),
                              ),
                            )
                        )),
                  ),

                )
            ),
          ),
         // circle
        ],
      ),
    );

  }



}









