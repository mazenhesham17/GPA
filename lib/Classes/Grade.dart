class Grade{
  String _abbr = '';
  double _point = 0.0 ;
  int _hour = 0 ;
  int _count = 0 ;

  Grade( this._abbr , this._point , this._hour , this._count ){}

  void setCount( int count ){
    _count = count ;
  }

  double getPoint(){
    return _point ;
  }

  int getHour(){
    return _hour ;
  }

  String getAbbr(){
    return _abbr ;
  }

  int getCount(){
    return _count ;
  }

}