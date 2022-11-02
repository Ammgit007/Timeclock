import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  var count = 0;

   List<worldtime> locations = [
    worldtime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    worldtime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    worldtime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    worldtime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    worldtime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    worldtime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    worldtime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    worldtime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updatetime(index) async{
    worldtime instance =locations[index];
    await instance.gettime();
    Navigator.pop(context,{
       'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isdaytime':instance.isdaytime,
    });
  }

  @override
  Widget build(BuildContext context) {

    print('build state ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose a Location'),
        centerTitle:true,
        backgroundColor: Colors.blue[400],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length ,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 2),
            child: Card(
              child: ListTile(
                onTap: (() {
                  updatetime(index);
                  
                }),
                title: Text(locations[index].location),
                leading: CircleAvatar(backgroundImage: AssetImage('assets/${locations[index].flag}')),
                
              ),
            ),
          );
        }
    ));
  }
}