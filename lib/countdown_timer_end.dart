import 'package:flutter/material.dart';
import 'package:tugas2/countdown_timer.dart';

class CountdownTimerEnd extends StatefulWidget {

  @override
  State createState() => _CountdownTimerEndState();
}

class _CountdownTimerEndState extends State<CountdownTimerEnd> {

  void _switchToCountdownTimer() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => CountdownTimer()),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[900],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Time is Up!', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                  onPressed: _switchToCountdownTimer, child: Text('Back'))
            ],
          )
        ],
      ),
    );
  }
}
