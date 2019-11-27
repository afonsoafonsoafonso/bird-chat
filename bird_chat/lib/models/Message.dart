
class Message extends Comparable<Message> {
  final String key;
  final int groupID;
  final String name;
  final String text;
  final int timestamp;

  Message({this.groupID, this.key, this.name, this.timestamp, this.text});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      key: json['user'] as String,
      groupID: json['groupID'] as int,
      name: json['user'] as String,
      text: json['text'] as String,
      timestamp: json['timestamp'] as int
    );
  }

  @override
  int compareTo(Message other) {
    if (timestamp == other.timestamp) {
      return name.compareTo(other.name);
    }
    return -timestamp.compareTo(other.timestamp);
  }
}