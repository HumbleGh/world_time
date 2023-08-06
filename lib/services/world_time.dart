import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; //Location name for the UI
  String time; //the time in that location
  String flag; //the url to an asset flag icon
  String url; // location url for api endpoint

  WorldTime(
      {required this.location,
      required this.time,
      required this.flag,
      required this.url});

  Future<void> getTime() async {
    //Requesting for data
    final response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    // print(data);

    //Get data proerties
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);

    // Create DateTime Object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    // Set the time property
    time = now.toString();
  }
}
