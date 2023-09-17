import 'package:flutter/material.dart';
import 'package:tugas2/countdown_timer.dart';
import 'package:tugas2/stopwatch.dart';

class About extends StatefulWidget {

  @override
  State createState() => _AboutState();
}

class _AboutState extends State<About> {

  void _switchToCountdownTimer() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => CountdownTimer()),
    );
  }

  void _switchToStopwatch() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => StopWatch()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Colors.blueGrey,
      ),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 100,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Image.asset('assets/logo_ftiuntar.png'),
              ),
              Container(
                width: 200,
                height: 60,
                child: Image.asset('assets/logo_si.png'),
              ),
              SizedBox(height: 20),
              Text('Octarifa Angela', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text('825210106', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.blueGrey,
        height: 60,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                child: TextButton(
                  onPressed: _switchToCountdownTimer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.timer_outlined, color: Colors.white),
                      Text('Timer', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
              Container(
                width: 100,
                child: TextButton(
                  onPressed: _switchToStopwatch,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.access_alarm, color: Colors.white),
                      Text('Stopwatch', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                width: 100,
                child: TextButton(
                  onPressed: null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, color: Colors.blueGrey),
                      Text('About', style: TextStyle(color: Colors.blueGrey))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
