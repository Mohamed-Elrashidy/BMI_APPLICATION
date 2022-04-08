import 'package:flutter/material.dart';
import 'result.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 170;
  int weight = 55;
  int age = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Body Mass Index',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Expanded(
            child: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        icn(context, 'Male'),
                        SizedBox(
                          width: 10,
                        ),
                        icn(context, 'Female'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey,
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Height',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            SizedBox(height: 15),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  heightVal.toStringAsFixed(1),
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                                Text(
                                  'CM',
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Slider(
                                value: heightVal,
                                onChanged: (newValue) =>
                                    setState(() => heightVal = newValue),
                                min: 90,
                                max: 220)
                          ],
                        ))),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      icn2(context, 'Weight'),
                      SizedBox(
                        width: 10,
                      ),
                      icn2(context, 'Age'),
                    ],
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 17,
                    color: Colors.teal,
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          var result = weight / pow(heightVal / 100, 2);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Result(
                                result: result, isMale: isMale, age: age);
                          }));
                        },
                        child: Text('Calculate',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold))),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded icn(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = type == 'Male' ? true : false;
          });
        },
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: (isMale && type == 'Male') || (!isMale && type == 'Female')
                  ? Colors.teal
                  : Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'Male' ? Icons.male : Icons.female,
                size: 70,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                type,
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded icn2(BuildContext context, String type) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              type,
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              type == 'Age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      type == 'Age' ? age-- : weight--;
                    });
                  },
                  heroTag: type == 'Age' ? 'age--' : 'weight--',
                  child: Icon(Icons.remove),
                  mini: true,
                ),
                SizedBox(width: 30),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      type == 'Age' ? age++ : weight++;
                    });
                  },
                  heroTag: type == 'Age' ? 'age++' : 'weight++',
                  child: Icon(Icons.add),
                  mini: true,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
