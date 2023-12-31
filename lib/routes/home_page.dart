import 'package:flutter/material.dart';
import 'dart:io';
import 'package:sleepy_timer/routes/countdown_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int hours = 0;
  int minutes = 0;

  void cancelShutdown() {
    const command = 'shutdown';
    final arguments = ['/a'];

    Process.start(command, arguments);
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
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Hours control
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                hours += 1;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_up,
                              color: Color(0xA4FFFFFF),
                              size: 30,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: ElevatedButton(
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
                                hours.toString().padLeft(2, '0'),
                                style: TextStyle(
                                    fontSize: 48, fontWeight: FontWeight.w600),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'h',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xA4FFFFFF)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (hours >= 1) {
                                  hours--;
                                } else {
                                  hours = 0;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xA4FFFFFF),
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 30, left: 16, right: 0),
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
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (minutes >= 50) {
                                        minutes -= 50;
                                        hours++;
                                      } else {
                                        minutes += 10;
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shadowColor: Colors.transparent,
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.keyboard_double_arrow_up,
                                    color: Color(0xA4FFFFFF),
                                    size: 30,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (minutes == 59) {
                                        minutes = 0;
                                        hours++;
                                      } else {
                                        minutes++;
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shadowColor: Colors.transparent,
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_up,
                                    color: Color(0xA4FFFFFF),
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
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
                                minutes.toString().padLeft(2, '0'),
                                style: TextStyle(
                                    fontSize: 48, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hours = 0;
                                    minutes = 0;
                                  });
                                },
                                splashRadius: 16,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                icon: minutes > 0 || hours > 0
                                    ? Icon(
                                        Icons.cancel_rounded,
                                        color: Color(0xA4FFFFFF),
                                        size: 30,
                                      )
                                    : Icon(
                                        Icons.cancel_rounded,
                                        color: Colors.transparent,
                                        size: 30,
                                      ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'min',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xA4FFFFFF)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (minutes >= 10) {
                                        minutes -= 10;
                                      } else {
                                        if (hours > 0) {
                                          minutes += 50;
                                          hours--;
                                        } else {
                                          minutes = 0;
                                        }
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shadowColor: Colors.transparent,
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.keyboard_double_arrow_down,
                                    color: Color(0xA4FFFFFF),
                                    size: 30,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (minutes >= 1) {
                                        minutes--;
                                      } else {
                                        if (hours > 0) {
                                          minutes = 59;
                                          hours--;
                                        } else {
                                          minutes = 0;
                                        }
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shadowColor: Colors.transparent,
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Color(0xA4FFFFFF),
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                                if (hours > 0 || minutes > 0) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CountdownPage(
                                        hours: hours,
                                        minutes: minutes,
                                      ),
                                    ),
                                  );
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
                              Icons.play_arrow_rounded,
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
