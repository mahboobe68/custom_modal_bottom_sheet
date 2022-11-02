
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'BottomSheetBackground.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Mahboobe Rezaei',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

// this class defines the full-screen semi-transparent modal dialog
// by extending the ModalRoute class
class FullScreenModal extends ModalRoute {

  // variables passed from the parent widget

  final Widget child;

  // constructor
  FullScreenModal({

    required this.child
  });

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.6);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    return Material(
      type: MaterialType.transparency,

      child: Stack(
        children: [
          GestureDetector(

            onTap: () => Navigator.of(context).pop(),// Handle your callback

          ),
          Positioned(
            top:MediaQuery.of(context).size.height * 0.500,
            left: MediaQuery.of(context).size.width * 0.0156,
            child: Container(
              height: MediaQuery.of(context).size.height /2,
              //  color: Colors.amber,
              child: child,
            ),

          ),

        ],
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // add fade animation
    return FadeTransition(
      opacity: animation,
      // add slide animation
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 50),
          end: Offset.zero,
        ).animate(animation),
        // add scale animation
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      ),
    );
  }
}

// This is the main screen of the application
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // this method shows the modal dialog
  dynamic _showModal(BuildContext context) async {
    // show the modal dialog and pass some data to it
    final result = await Navigator.of(context).push(FullScreenModal(
      //  title: 'This is a title',
      //description: 'Just some dummy description text',
        child: BottomSheetBackground(
          body: Container(color:Colors.white.withOpacity(0.75),),
          background: Lottie.asset(
            'images/background.json',
            width: MediaQuery.of(context).size.width /2,
            height: MediaQuery.of(context).size.height /2,
            fit: BoxFit.fill,
          ),
          visibleCircle: true,
          circleEvatar: Image.asset(
            "images/null.png",
            fit: BoxFit.cover,
          ),)
    ));

    // print the data returned by the modal if any
    debugPrint(result.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mahboobe Rezaei')),
      body: Container(),
      // this button is used to show the modal
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showModal(context),
        label: const Text('Show Modal'),
        icon: const Icon(Icons.play_arrow),
      ),
    );
  }
}