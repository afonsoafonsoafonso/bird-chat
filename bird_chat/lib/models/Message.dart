
class Message extends Comparable<Message> {
  final String key;
  final String name;
  final String text;
  final int timestamp;

  Message({this.key, this.name, this.timestamp, this.text});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      key: json['user'] as String,
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
    return timestamp.compareTo(other.timestamp);
  }
}