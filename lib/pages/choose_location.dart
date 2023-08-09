import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        location: 'Accra',
        time: 'time',
        flag: 'gh.jpg',
        isDaytime: 'isDaytime',
        url: 'Africa/Accra'),
    WorldTime(
        location: 'Lagos',
        time: 'time',
        flag: 'ng.jpg',
        isDaytime: 'isDaytime',
        url: 'Africa/Lagos'),
    WorldTime(
        location: 'Cairo',
        time: 'time',
        flag: 'egypt.jpg',
        isDaytime: 'isDaytime',
        url: 'Africa/Cairo'),
    // WorldTime(
    //     location: 'Abuja',
    //     time: 'time',
    //     flag: 'us.jpg',
    //     isDaytime: 'isDaytime',
    //     url: 'Africa/Abuja'),
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
