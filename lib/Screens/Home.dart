import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpa/Classes/Calculator.dart';
import 'package:gpa/Widgets/GPACard.dart';
import 'package:gpa/Widgets/GradeCard.dart';
import '../Classes/GPA.dart';
import '../constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _gpaAmount = 0 ;
  int _hours = 0 ;
  Home(){
    GPA gpa = GPA() ;
    _gpaAmount = gpa.getGPA() ;
    _hours = gpa.getHours() ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            GPA gpa = GPA();
            gpa.reset() ;
          });
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.5,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(100.0))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.24,
                ),
                Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GPACard(),
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.grey,
                  height: 1.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Grades',
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.width * 0.5,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Grades.length,
                        itemBuilder: (context, index) => GradeCard(
                          grade: Grades[index],
                          index: index,
                        ))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: (){
                            setState(() {
                              inputs = List.filled(18, 0, growable: false) ;
                            });
                          } ,
                          child: Text(
                            'Reset',
                            style: const TextStyle(fontSize: 25, color: Colors.red),
                          )),
                      TextButton(
                          onPressed: () {
                            Calculator calculator = Calculator();
                            double gpaAmount = calculator.calculate();
                            int hours = calculator.getHours();
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                  color: Colors.deepPurpleAccent,
                                  height:
                                  MediaQuery.of(context).size.height * 0.3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text('Your GPA is $gpaAmount',
                                            style: const TextStyle(
                                                fontSize: 25,
                                                color: Colors.white)),
                                        Text('Do you want to save the result ?',
                                            style: const TextStyle(
                                                fontSize: 25,
                                                color: Colors.white)),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty
                                                          .all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                15.0),
                                                          )),
                                                      backgroundColor:
                                                      MaterialStateProperty
                                                          .all(Colors.white)),
                                                  child: Text('No',
                                                      style: const TextStyle(
                                                          fontSize: 25,
                                                          color: Colors.red))),
                                              TextButton(
                                                  onPressed: () {
                                                    GPA gpa = GPA();
                                                    int newHours =
                                                        hours + gpa.getHours();
                                                    gpa.setHours(newHours);
                                                    gpa.setGPA(gpaAmount);
                                                    setState(() {
                                                      _gpaAmount = gpa.getGPA() ;
                                                      _hours = gpa.getHours() ;
                                                    });
                                                    inputs = List.filled(18, 0, growable: false) ;
                                                    Navigator.pop(context);
                                                  },
                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty
                                                          .all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                15.0),
                                                          )),
                                                      backgroundColor:
                                                      MaterialStateProperty
                                                          .all(Colors.white)),
                                                  child: Text('Save',
                                                      style: const TextStyle(
                                                          fontSize: 25,
                                                          color: Colors.green))),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          },
                          child: Text('Calculate',
                              style: const TextStyle(
                                  fontSize: 25, color: Colors.green))),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
