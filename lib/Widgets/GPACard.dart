import 'package:flutter/material.dart';
import 'package:gpa/Classes/GPA.dart';


class GPACard extends StatefulWidget {
  const GPACard({Key? key}) : super(key: key);

  @override
  _GPACardState createState() => _GPACardState();
}

class _GPACardState extends State<GPACard> {
  GPA gpa = GPA();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          new BoxShadow(
            color: Colors.grey.withOpacity(0.5) ,
            blurRadius: 60.0 ,
            spreadRadius: 1.0 ,
          )
        ]
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.75,
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Item(
                    value: gpa.getGPA(),
                    title: 'GPA',
                    icon: Icon(Icons.schedule_outlined , size: 22, color: Colors.deepPurpleAccent,),
                  ),
                  Container(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  Item(
                    value: gpa.getHours().toDouble(),
                    title: 'Hours',
                    icon: Icon(Icons.schedule_outlined , size: 22, color: Colors.deepPurpleAccent,),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  Item({Key? key, this.value, this.title, this.icon})
      : super(key: key);

  final double? value;
  final String? title;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title!,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold , color: Colors.deepPurpleAccent)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value!.toString(),
                  style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold , color: Colors.deepPurpleAccent )),
              icon!
            ],
          ),
        )
      ],
    );
  }
}
