import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    //Accra
    WorldTime(
        location: 'Accra',
        time: 'time',
        flag: 'gh.jpg',
        isDaytime: 'isDaytime',
        url: 'Africa/Accra'),
    // Lagos
    WorldTime(
        location: 'Lagos',
        time: 'time',
        flag: 'ng.jpg',
        isDaytime: 'isDaytime',
        url: 'Africa/Lagos'),
    // Cairo
    WorldTime(
        location: 'Cairo',
        time: 'time',
        flag: 'egypt.jpg',
        isDaytime: 'isDaytime',
        url: 'Africa/Cairo'),
    // Maputo
    WorldTime(
        location: 'Maputo',
        time: 'time',
        flag: 'Mozambique.jpg',
        isDaytime: 'isDaytime',
        url: 'Africa/Maputo'),
    //Monrovia
    WorldTime(
        location: 'Monrovia',
        time: 'time',
        flag: 'liberia.jpg',
        isDaytime: 'isDaytime',
        url: 'Africa/Monrovia'),
    // Nairobi
    WorldTime(
        location: 'Nairobi',
        time: 'time',
        flag: 'us.jpg',
        isDaytime: 'isDaytime',
        url: 'Africa/Nairobi'),
    //Tripoli
    WorldTime(
        location: 'Tripoli',
        time: 'time',
        flag: 'us.jpg',
        isDaytime: 'isDaytime',
        url: 'Africa/Maputo'),
    //Tunis
    WorldTime(
        location: 'Tunis',
        time: 'time',
        flag: 'us.jpg',
        isDaytime: 'isDaytime',
        url: 'Africa/Tunis'),
    //Adak
    WorldTime(
        location: 'Adak',
        time: 'time',
        flag: 'us.jpg',
        isDaytime: 'isDaytime',
        url: 'Africa/Adak'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    // Navigate to the home screen
    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
        itemCount: locations.length,
      ),
    );
  }
}
