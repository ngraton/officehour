import 'package:meta/meta.dart';

class Participant {
  final String id;
  final String name;

  Participant({@required this.id, @required this.name});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> participantMap = Map<String, dynamic>();
    participantMap['id'] = this.id;
    participantMap['name'] = this.name;
    return participantMap;
  }

  factory Participant.fromMap(Map<String, dynamic> map) {
    return Participant(id: map['id'], name: map['name']);
  }
}
