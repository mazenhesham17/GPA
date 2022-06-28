import 'package:flutter/material.dart';
import 'package:gpa/Classes/Grade.dart';
import 'package:gpa/Widgets/NumberSelector.dart';


class GradeCard extends StatelessWidget {
  const GradeCard({Key? key, required this.grade , required this.index}) : super(key: key);
  final Grade grade ;
  final int index ;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      color: Colors.deepPurpleAccent.withOpacity(0.8),
      child: SizedBox(
        height: MediaQuery.of(context).size.width*0.5,
        width: MediaQuery.of(context).size.width*0.8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(grade.getAbbr() , style: const TextStyle( fontSize: 35, color: Colors.white), ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        NumberSelector(index: 2*index,) ,
                        Text('3', style: const TextStyle( fontSize: 25, color: Colors.white), ),
                        Icon(Icons.schedule_outlined , size: 25 , color: Colors.white,)
                      ],
                    ),
                    Container(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        NumberSelector(index: 2*index + 1,) ,
                        Text('2', style: const TextStyle( fontSize: 25, color: Colors.white), ),
                        Icon(Icons.schedule_outlined , size: 25 , color: Colors.white,)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}