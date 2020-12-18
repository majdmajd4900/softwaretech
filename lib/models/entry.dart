class Entry {
  int id;
  String value;

  Entry({this.id, this.value});

  Entry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this.id;
    data['value'] = this.value;
    return data;
  }
}