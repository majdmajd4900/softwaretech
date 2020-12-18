import 'package:software_technology/models/entry.dart';
import 'package:software_technology/models/tag.dart';
import 'package:software_technology/models/topic.dart';
import 'package:software_technology/models/users.dart';

class EntryDetaild {
  Entry entry;
  Topic topic;
  List<Tag> tags;
  int rankUp;
  int rankDown;
  Users user;
  int fav;

  EntryDetaild(
      {this.entry,
      this.topic,
      this.tags,
      this.rankUp,
      this.rankDown,
      this.user,
      this.fav});

  EntryDetaild.fromJson(Map<String, dynamic> json) {
    entry = json['entry'] != null ? new Entry.fromJson(json['entry']) : null;
    topic = json['topic'] != null ? new Topic.fromJson(json['topic']) : null;
    if (json['tags'] != null) {
      tags = new List<Tag>();
      json['tags'].forEach((v) {
        tags.add(new Tag.fromJson(v));
      });
    }
    rankUp = json['rankUp'];
    rankDown = json['rankDown'];
    user = json['user'] != null ? new Users.fromJson(json['user']) : null;
    fav = json['fav'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.entry != null) {
      data['entry'] = this.entry.toJson();
    }
    if (this.topic != null) {
      data['topic'] = this.topic.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    data['rankUp'] = this.rankUp;
    data['rankDown'] = this.rankDown;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['fav'] = this.fav;
    return data;
  }

  
}


