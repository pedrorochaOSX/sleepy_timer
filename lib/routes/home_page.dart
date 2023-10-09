import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController hourEditController = TextEditingController();
  final TextEditingController minuteEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff202020),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Hours TextField
                    Column(
                      children: [
                        Expanded(
                          child: TextField(
                            maxLines: 1,
                            controller: hourEditController,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            cursorColor: Color(0xffffffff),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(16),
                              counterText: '',
                              hintText: '00',
                              hintStyle: TextStyle(
                                color: Color(0x55ffffff),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        ':',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                    // Minutes TextField
                    Expanded(
                      child: TextField(
                        maxLines: 1,
                        maxLength: 2,
                        controller: minuteEditController,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        cursorColor: Color(0xffffffff),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          counterText: '',
                          hintText: '00',
                          hintStyle: TextStyle(
                            color: Color(0x55ffffff),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
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
                          padding: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  appendMinute(1);
                                });
                              },
                              child: Text('1')),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  appendMinute(2);
                                });
                              },
                              child: Text('2')),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  appendMinute(3);
                                });
                              },
                              child: Text('3')),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  appendMinute(4);
                                });
                              },
                              child: Text('4')),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  appendMinute(5);
                                });
                              },
                              child: Text('5')),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  appendMinute(6);
                                });
                              },
                              child: Text('6')),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  appendMinute(7);
                                });
                              },
                              child: Text('7')),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  appendMinute(8);
                                });
                              },
                              child: Text('8')),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  appendMinute(9);
                                });
                              },
                              child: Text('9')),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  appendMinute(0);
                                });
                              },
                              child: Text('0')),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  hourEditController.text = '';
                                  minuteEditController.text = '';
                                });
                              },
                              child: Text('Clear')),
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

  void appendMinute(int value) {
    minuteEditController.text += value.toString();
    int currentMinutes = int.parse(minuteEditController.text);

    if (currentMinutes > 60) {
      int currentHours = currentMinutes ~/ 60;
      currentMinutes = currentMinutes % 60;
      hourEditController.text = currentHours.toString();

      if (currentMinutes >= 10) {
        minuteEditController.text = currentMinutes.toString();
      } else {
        minuteEditController.text = '0$currentMinutes';
      }
    } else {
      minuteEditController.text = currentMinutes.toString();
    }
  }
}
