import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    //Requesting for data
    Response response =
        await get('http://worldtimeapi.org/api/timezone/Africa/Accra' as Uri);
    Map data = jsonDecode(response.body);
    //print(data);

    //Get data proerties
    String datetime = data['datetime'];
    String offset = data['utc_offset'];
    String timezome = data['timezone'];

    // Create DateTime Object
    DateTime now = DateTime.parse(datetime);
    now = now.add(const Duration(hours: 1));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('hey'),
    );
  }
}
