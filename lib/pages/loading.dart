// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {

  //late final Locale info;

  //Loading({required this.info});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(flag: 'kenya.png', location: 'Kenya', url: 'Africa/Nairobi');
    //WorldTime instance = WorldTime(flag: '${widget.info.flag}', location: '${widget.info.location}', url: '${widget.info.url}');
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
    });

  }

  @override

  void initState(){
    super.initState();
    setupWorldTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: SpinKitRipple(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}