class Person {
  const Person({
    this.name,
    this.key,
  });

  final String name;
  final String key;
 // final List<String> affilition;


  factory Person.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Person(name: json['name'] as String, key: json['key'] as String);
  }
}

class Group {
  const Group({this.name, this.location, this.participants});

  final String name;
  final String location;
  final List<Person> participants;

  factory Group.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Group(name: json['name'] as String, location: json['location'] as String, participants: );
  }

    Map<String, dynamic> toJson() => {
          'name': name,
          'location': location,
        };
  
}
