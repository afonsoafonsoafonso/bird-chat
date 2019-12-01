import 'package:bird_chat/services/backend.dart';

class User extends Serializable{
  String key;
  String name;
  String affiliation;
  String bio;
  String url;
  String picUrl;

  User({this.key, this.name, this.affiliation, this.bio, this.picUrl, this.url});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      key: json['Key'],
      name: json['Name'],
      affiliation: json['Affiliation'],
      bio: json['Bio'],
      url: json['URL'],
      picUrl: json['PictureURL']
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    'Key': key,
    'Name': name,
    'Affilitation': affiliation,
    'Bio': bio,
    'URL': url,
    'PictureURL': picUrl
  };

}