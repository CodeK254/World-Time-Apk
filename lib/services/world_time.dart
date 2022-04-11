import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  late String time;
  String flag;
  String url;
  late bool isDayTime;

  WorldTime({required this.flag,required this.location,required this.url});

  Future<void> getTime() async {

    try {
      //make the response.
      http.Response response = await http.get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));

      Map data = jsonDecode(response.body);

      //get properties from json data.

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //create a DateTime object.
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //setting the value of time.
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false ;
      time = DateFormat.jm().format(now);
    }
    catch(e) {
      print('caught error: $e');
      time = 'Could not complete your request, try again later';
    }
  }

}

