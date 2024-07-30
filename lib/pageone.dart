import 'package:flutter/material.dart';

class pageone extends StatefulWidget {
  const pageone({super.key});

  @override
  State<pageone> createState() => _pageoneState();
}

class _pageoneState extends State<pageone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Center(
            child: Text('Page One',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.red
              )),
          )
      ),
    );
  }
}
