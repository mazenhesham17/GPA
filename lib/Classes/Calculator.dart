import 'package:gpa/Classes/GPA.dart';
import 'package:gpa/constants.dart';
import 'Grade.dart';

class Calculator{

  static final Calculator _instance = Calculator._internal() ;

  factory Calculator(){
    return _instance ;
  }

  Calculator._internal() {}

  double calculate(){
    List<Grade> grades = generateGrades() ;
    GPA gpa = GPA() ;
    double points = gpa.getGPA()*gpa.getHours() ;
    double hours = gpa.getHours().toDouble() ;
    for ( var grade in grades ){
      points += grade.getPoint()*grade.getHour()*grade.getCount() ;
      hours += grade.getHour()*grade.getCount() ;
    }
    print( hours ) ;
    return round(points/hours) ;
  }

  int getHours(){
    List<Grade> grades = generateGrades() ;
    int hours = 0 ;
    for ( var grade in grades ){
      hours += grade.getHour()*grade.getCount() ;
    }
    return hours ;
  }

  List<Grade> generateGrades(){
    List<Grade> result = [] ;
    for ( int i = 0 ; i < inputs.length ; i++ ){
      int par = (i/2).toInt() ;
      Grade grade = Grade( Grades[par].getAbbr() , Grades[par].getPoint(), ( i % 2 == 0 ? 3 : 2), inputs[i]) ;
      if ( inputs[i] > 0 )
        result.add(grade) ;
    }
    return result ;
  }

  double round( double value ){
    double mod = 100.0.toDouble() ;
    return ( (value * mod).roundToDouble() / mod ) ;
  }
}