import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tugas2/countdown_timer.dart';
import 'package:tugas2/about.dart';

class StopWatch extends StatefulWidget {

  @override
  State createState() => StopWatchState();
}

class StopWatchState extends State<StopWatch> {
  late bool isTicking = true;
  int seconds = 0;
  late Timer timer;
  int milliseconds = 0;
  final laps = <int>[];
  final itemHeight = 60.0;
  final scrollController = ScrollController();

  void _onTick(Timer time) {
    setState(() {
      milliseconds += 100;
    });
  }

  String _secondString(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }

  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 100), _onTick);

    setState(() {
      milliseconds = 0;
      isTicking = true;
      laps.clear();
    });
  }

  void _stopTimer() {
    setState(() {
      timer.cancel();
      isTicking = false;
    });
  }

  void _resetTimer() {
    setState(() {
      milliseconds = 0;
    });
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      _resetTimer();
    });

    scrollController.animateTo(
        itemHeight * laps.length,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn);
  }

  void _switchToAbout() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => About()),
    );
  }

  void _switchToCountdownTimer() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => CountdownTimer()),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: buildCounter(context)),
          Expanded(child: _buildLapDisplay())
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
                color: Colors.white,
                width: 100,
                child: TextButton(
                  onPressed: null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.access_alarm, color: Colors.blueGrey),
                      Text('Stopwatch', style: TextStyle(color: Colors.blueGrey))
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
              'Lap ${laps.length + 1}',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.blueGrey[900], fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(
              _secondString(milliseconds),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.blueGrey[900]),
            ),
            SizedBox(width: 20),
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
                  onPressed: () => _startTimer(),
                  child: Text('Start'),
              ),
              SizedBox(width: 20),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                  onPressed: () => _stopTimer(),
                  child: Text('Stop'),
              ),
              SizedBox(width: 20),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.purpleAccent),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                  onPressed: () => _lap(),
                  child: Text('Lap'))
            ],
          );
  }

  Widget _buildLapDisplay() {
    return Scrollbar(
        child: ListView.builder(
          controller: scrollController,
            itemExtent: itemHeight,
            itemCount: laps.length,
            itemBuilder: (context, index) {
              final milliseconds = laps[index];
              return ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 50),
                title: Text('Lap ${index + 1}'),
                trailing: Text(_secondString(milliseconds)),
              );
            },
        ),
    );
  }
}

