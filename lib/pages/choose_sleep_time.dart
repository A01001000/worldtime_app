import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ChooseSleepTime extends StatefulWidget {
  @override
  _ChooseSleepTimeState createState() => _ChooseSleepTimeState();
}

class _ChooseSleepTimeState extends State<ChooseSleepTime> {

  Map data = {};

  String newTime(DateTime datetime, int addValue) {
    String time = DateFormat.jm().format(datetime.add(Duration(minutes: addValue)));
    return time;
  }

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    List<String> times = [
      newTime(data['now'], 540),
      newTime(data['now'], 450),
      newTime(data['now'], 360),
      newTime(data['now'], 270),
    ];
    print(times);

    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        leading: BackButton(
            color: Colors.black
        ),
        backgroundColor: Colors.grey[100],
        title: Text(
            'Choose a Time to Wake Up',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Georgia',
        ),
      ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: times.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 1.0, horizontal: 4.0),
                child: Card(
                  color: Colors.black54,
                  child: ListTile(
                    onTap: () {
                      Navigator.pop(context, {
                        'alarm': times[index],
                      });
                    },
                    title: Text(
                        times[index],
                      style: GoogleFonts.sourceSansPro(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
            );
          }),
    );
  }
}
