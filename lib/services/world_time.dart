import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class worldtime{
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isdaytime;

  worldtime({required this.location, required this.flag, required this.url});

   Future<void> gettime() async{

    try{
    Response response = await get( Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data =jsonDecode(response.body);
    // print(data);
    
    //get properties
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(0,3);

    // print(datetime);
    // print(offset);

    // create datetime obj
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours:int.parse(offset)));

    //ternary operator
    isdaytime = now.hour>6 && now.hour<20?true:false;
    
    time = DateFormat.jm().format(now);
    }
    catch(e){
      print('Caught Error:$e');
      time='Could not get data';
    }

   }

}