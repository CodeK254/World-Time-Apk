// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, override_on_non_overriding_member, unused_local_variable

import 'package:flutter/material.dart';
import 'package:world_time_app/pages/loading.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {

  //late final Locale info;  

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Nairobi',location: 'Kenya',flag: 'kenya.png'),
    WorldTime(url: 'Africa/Cairo',location: 'Egypt',flag: 'egypt.png',),
    WorldTime(url: 'Africa/Accra',location: 'Ghana',flag: 'ghana.png'),
    WorldTime(url: 'Africa/Lagos',location: 'Nigeria',flag: 'nigeria.png'),
    WorldTime(url: 'Africa/Johannesburg',location: 'South Africa',flag: 'sa.png'),
    WorldTime(url: 'Africa/Casablanca',location: 'Morocco',flag: 'morocco.png'),
    WorldTime(url: 'Africa/Tunis',location: 'Tunisia',flag: 'tunisia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to homeScreen parsing the index data.
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        backgroundColor: Colors.teal[900],
        centerTitle: true,
        title: Text(
          'Choose Location',
        ),
      ),
      body: ListView.builder( 
          itemCount: locations.length,
          itemBuilder: (context, int index) {
            return Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.08,
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  contentPadding: EdgeInsets.fromLTRB(15,5,0,5),
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                  title: Text(
                    '${locations[index].location}',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'PlayfairDisplay',
                      letterSpacing: 1.5,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}