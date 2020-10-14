import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  Map alarmData = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    alarmData = alarmData.isNotEmpty ? alarmData : ModalRoute.of(context).settings.arguments;
    String alarm = alarmData['alarm'];
    alarm = alarm.isNotEmpty ? 'Wake up at: $alarm' : "";
    String undo = alarm.isNotEmpty ? "undo" : "";
    print(data);

    //set background
    String bgImage = data['isDaytime'] ? 'day5.jpg' : 'night2.jpg';
    Color bgColor = data['isDaytime'] ? Colors.white: Colors.black;
    Color textColor = data['isDaytime'] ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDaytime': result['isDaytime'],
                            'flag': result['flag'],
                            'now': result['now']
                          };
                        });
                      },
                      icon: Icon(
                          Icons.edit_location,
                          color: textColor,
                        ),
                      label: Text(
                          'Edit Location',
                        style: GoogleFonts.sourceSansPro(
                          color: textColor,
                        ),
                      ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: textColor,
                          fontFamily: 'Georgia',
                        )
                      )
                    ]
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: textColor,
                      fontFamily: 'Georgia',
                    ),
                  ),
                  SizedBox(height: 20.0),
                  FlatButton.icon(
                      onPressed: () async {
                        dynamic resultTwo = await Navigator.pushNamed(
                            context,
                            '/sleeptime',
                            arguments: <String, DateTime> {
                              'now': data['now'],
                            });
                        setState(() {
                          alarmData = {
                            'alarm': resultTwo['alarm'],
                          };
                        });
                      },
                      icon: Icon(
                        Icons.access_time,
                        color: textColor,
                      ),
                      label: Text(
                        'Generate Best Wake Up Times',
                        style: GoogleFonts.sourceSansPro(
                          color: textColor,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  SizedBox(height: 20.0),
                  Text(
                    alarm,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 30.0,
                      fontFamily: 'Georgia',
                    ),
                  ),
                  FlatButton(
                      onPressed: () async {
                          dynamic resultTwo = await Navigator.pushNamed(
                              context, "/");
                      },
                      child: Text(
                        undo,
                        style: GoogleFonts.sourceSansPro(
                          color: textColor,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}

