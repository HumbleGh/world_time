import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; //Location name for the UI
  String time; //the time in that location
  String flag; //the url to an asset flag icon
  String url; // location url for api endpoint

  WorldTime({this.location, this.time, this.flag, this.url});

  void fetchData() async {
    //Requesting for data
    final response =
        await get('http://worldtimeapi.org/api/timezone/$url' as Uri);
    Map data = jsonDecode(response.body);
    // print(data);

    //Get data proerties
    String datetime = data['datetime'];
    String offset = data['utc_offset'].subsrting(1, 3);
    //String timezome = data['timezone'];

    // Create DateTime Object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    // Set the time property
    time = now.toString();
  }
}

WorldTime instance = WorldTime({location: 'Lagos' this: '', this.flag, this.url});
