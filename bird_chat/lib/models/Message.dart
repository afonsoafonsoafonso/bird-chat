
class Message extends Comparable<Message> {
  final String key;
  int groupID;
  final String text;
  final int timestamp;

  Message({this.groupID, this.key, this.timestamp, this.text});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      key: json['user'] as String,
      groupID: json['groupID'] as int,
      text: json['text'] as String,
      timestamp: json['timestamp'] as int
    );
  }

  @override
  int compareTo(Message other) {
    if (timestamp == other.timestamp) {
      return key.compareTo(other.key);
    }
    return -timestamp.compareTo(other.timestamp);
  }
}