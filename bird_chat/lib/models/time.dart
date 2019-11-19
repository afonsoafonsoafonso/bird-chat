class Time {

  int hours;
  int minutes;
  
  Time({this.hours, this.minutes});

  factory Time.fromJson(Map<String,dynamic> json) {
    return Time (
      hours: json['hours'] as int,
      minutes: json['minutes'] as int,
    );
  }

}