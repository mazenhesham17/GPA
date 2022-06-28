import 'package:shared_preferences/shared_preferences.dart';

class GPA{

  static final GPA _instance = GPA._internal() ;

  factory GPA(){
    return _instance ;
  }

  GPA._internal() {}

  double _gpa = 0.0 ;
  int _hours = 0 ;

  void setGPA( double gpa ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance() ;
    prefs.setInt('gpa', ( gpa * 100).toInt() ) ;
  }
  void setHours( int hours ) async{
    SharedPreferences prefs = await SharedPreferences.getInstance() ;
    prefs.setInt('hours', hours ) ;
  }

  void _getgpa() async{
    SharedPreferences prefs = await SharedPreferences.getInstance() ;
    _gpa = (prefs.getInt('gpa') ?? 0 )/100 ;
  }

  Future _gethour() async{
    SharedPreferences prefs = await SharedPreferences.getInstance() ;
    _hours = (prefs.getInt('hours') ?? 0 ) ;
  }

  void reset() async {
    SharedPreferences prefs = await SharedPreferences.getInstance() ;
    prefs.setInt('gpa', 0 ) ;
    prefs.setInt('hours', 0 ) ;
    while ( prefs.getInt('hours') != 0 || prefs.getInt('gpa') != 0 ){
      await prefs.reload() ;
    }
  }

  double getGPA() {
    _getgpa() ;
    return _gpa ;
  }
  int getHours(){
    _gethour() ;
    return _hours ;
  }
}