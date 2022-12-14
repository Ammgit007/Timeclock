import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
 
  String time ='Loading';
  
  void setupworldtime() async {
   worldtime instance = worldtime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.gettime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isdaytime':instance.isdaytime,
    });
  }
 

  @override
  void initState() {
    super.initState();
    setupworldtime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child:SpinKitPouringHourGlass(
  color: Colors.white,
  size: 80.0,
),
      )
    );
  }
}