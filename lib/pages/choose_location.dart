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
        flag: 'gh.png',
        isDaytime: 'isDaytime',
        url: 'Africa/Accra'),
    WorldTime(
        location: 'Accra',
        time: 'time',
        flag: 'gh.png',
        isDaytime: 'isDaytime',
        url: 'Africa/Accra'),
    WorldTime(
        location: 'Accra',
        time: 'time',
        flag: 'gh.png',
        isDaytime: 'isDaytime',
        url: 'Africa/Accra'),
    WorldTime(
        location: 'Accra',
        time: 'time',
        flag: 'gh.png',
        isDaytime: 'isDaytime',
        url: 'Africa/Accra'),
  ];

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
          return Card(
            child: ListTile(
              onTap: () {},
              title: Text(locations[index].location),
            ),
          );
        },
        itemCount: locations.length,
      ),
    );
  }
}
