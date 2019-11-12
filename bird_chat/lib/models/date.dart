class Date {

  int day;
  int month;
  int year;
  
  Date({this.day, this.month, this.year});

  factory Date.fromJson(Map<String,dynamic> json) {
    return Date (
      day: json['day'] as int,
      month: json['month'] as int,
      year: json['year'] as int,
    );
  }

}