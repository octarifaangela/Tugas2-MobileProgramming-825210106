import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tugas2/stopwatch.dart';
import 'package:tugas2/countdown_timer_end.dart';
import 'package:tugas2/about.dart';

class CountdownTimer extends StatefulWidget {

  @override
  State createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  bool isTicking = true;
  int seconds = 0;
  late Timer timer;
  final laps = <int>[];

  void _onTick(Timer timer) {
    setState(() {
      seconds -= 1;
      if (seconds == 0) {
        timer.cancel();

        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => CountdownTimerEnd()),
        );
      }
    }
    );
  }

  String _secondString(int milliseconds) {
    return '$seconds';
  }

  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _startCountdownTimer() {
    timer = Timer.periodic(Duration(seconds: 1), _onTick);
    setState(() {
      isTicking = true;
    });
  }

  void _pauseCountdownTimer() {
    setState(() {
      timer.cancel();
      isTicking = true;
    });
  }

  void _stopCountdownTimer() {
    setState(() {
      seconds = 0;
      timer.cancel();
      isTicking = true;
    });
  }

  void _switchToAbout() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => About()),
    );
  }

  void _switchToStopwatch() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => StopWatch()),
    );
  }

  //Input waktu berapa lama countdown timer akan habis
  void _plusOne() {
    seconds += 1;
    setState(() {
      isTicking = true;
    });
  }

  void _plusFive() {
    seconds += 5;
    setState(() {
      isTicking = true;
    });
  }

  void _plusTen() {
    seconds += 10;
    setState(() {
      isTicking = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countdown Timer'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: buildCounter(context)),
          Text('Input your countdown time.'),
          Expanded(child: _buildLapDisplay()),
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
                color: Colors.white,
                width: 100,
                child: TextButton(
                  onPressed: null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.timer_outlined, color: Colors.blueGrey),
                      Text('Timer', style: TextStyle(color: Colors.blueGrey))
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
                width: 100,
                child: TextButton(
                  onPressed: _switchToAbout,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, color: Colors.white),
                      Text('About', style: TextStyle(color: Colors.white))
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

  Widget buildCounter(BuildContext context) {
    return Container(
      color: Colors.blueGrey[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _secondString(seconds),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            'Seconds',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
          ),
          SizedBox(height: 20),
          buildControls(),
          SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget buildControls() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () => _startCountdownTimer(),
              child: Text('Start'),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.purpleAccent),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () => isTicking ? _pauseCountdownTimer() : null,
              child: Text('Pause'),
            ),
            SizedBox(width: 20),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () => isTicking ? _stopCountdownTimer() : null,
                child: Text('Stop'))
          ],
        );
  }

  Widget _buildLapDisplay() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
              onPressed: _plusOne,
              child: Text('+1 Second')),
          SizedBox(width: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
              onPressed: _plusFive,
              child: Text('+5 Seconds')),
          SizedBox(width: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
              onPressed: _plusTen,
              child: Text('+10 Seconds')),
        ],
      ),
    );
  }
}
