import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await setupWorldTime();
  }

  Future<void> setupWorldTime() async {
    WorldTime instance = WorldTime(
      location: 'Berlin',
      flag: 'Berlin.png',
      url: 'Europe/Berlin',
      time: 'time',
    );
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
    });
    //   setState(() {
    //     time = instance.time;
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Text('loading'),
      ),
    );
  }
}
