import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';

// ignore: must_be_immutable
class CountdownPage extends StatefulWidget {
  CountdownPage({super.key, required this.hours, required this.minutes});
  int hours;
  int minutes;

  @override
  State<CountdownPage> createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  final oneSecond = Duration(seconds: 1);

  int fullTime = 0;
  int minutes = 0;
  int seconds = 0;
  int hoursToMinutes = 0;
  int pausedFullTime = 0;
  bool paused = false;

  void startShutdown() {
    const command = 'shutdown';
    final arguments = ['/s', '/f', '/t', fullTime.toString()];

    Process.start(command, arguments);
  }

  void cancelShutdown() {
    const command = 'shutdown';
    final arguments = ['/a'];
    Process.start(command, arguments);

    fullTime = 0;
  }

  void pauseShutdown() {
    const command = 'shutdown';
    final arguments = ['/a'];
    Process.start(command, arguments);

    paused = true;
    pausedFullTime = fullTime;
    fullTime = 0;
  }

  @override
  void initState() {
    super.initState();

    minutes = widget.minutes;
    hoursToMinutes = widget.hours * 60;

    minutes += hoursToMinutes;
    fullTime = minutes * 60;

    startShutdown();

    Timer.periodic(oneSecond, (timer) {
      if (fullTime > 0) {
        setState(() {
          if (seconds == 0) {
            if (widget.minutes == 0) {
              if (widget.hours > 0) {
                widget.hours--;
                widget.minutes = 59;
              } else {
                timer.cancel();
                return;
              }
            } else {
              widget.minutes--;
            }
            seconds = 59;
          } else {
            seconds--;
          }
          fullTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff202020),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Hours control
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              minimumSize: Size(80, 62),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text(
                              widget.hours.toString().padLeft(2, '0'),
                              style: TextStyle(
                                  fontSize: 48, fontWeight: FontWeight.w600),
                            )),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, left: 0, right: 0),
                      child: Text(
                        ':',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),

                    // Minutes control
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              minimumSize: Size(80, 62),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text(
                              widget.minutes.toString().padLeft(2, '0'),
                              style: TextStyle(
                                  fontSize: 48, fontWeight: FontWeight.w600),
                            )),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, left: 0, right: 0),
                      child: Text(
                        ':',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),

                    // Seconds control
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              minimumSize: Size(80, 62),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text(
                              seconds.toString().padLeft(2, '0'),
                              style: TextStyle(
                                  fontSize: 48, fontWeight: FontWeight.w600),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (paused == false) {
                                  pauseShutdown();
                                } else {
                                  fullTime = pausedFullTime;
                                  pausedFullTime = 0;
                                  startShutdown();
                                  Timer.periodic(oneSecond, (timer) {
                                    if (fullTime > 0) {
                                      setState(() {
                                        if (seconds == 0) {
                                          if (widget.minutes == 0) {
                                            if (widget.hours > 0) {
                                              widget.hours--;
                                              widget.minutes = 59;
                                            } else {
                                              timer.cancel();
                                              return;
                                            }
                                          } else {
                                            widget.minutes--;
                                          }
                                          seconds = 59;
                                        } else {
                                          seconds--;
                                        }
                                        fullTime--;
                                      });
                                    } else {
                                      timer.cancel();
                                    }
                                  });
                                  paused = false;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              backgroundColor: Color(0xFF0C0C0C),
                              minimumSize: Size(80, 62),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Icon(
                              paused == false
                                  ? Icons.pause_rounded
                                  : Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                cancelShutdown();
                                Navigator.of(context).pop();
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              backgroundColor: Color(0xFF0C0C0C),
                              minimumSize: Size(80, 62),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Icon(
                              Icons.stop_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
