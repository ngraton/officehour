import 'package:meta/meta.dart';
import 'package:officehour/models/participant.dart';

class Appointment {
  final String id;
  final DateTime start;
  final DateTime end;
  final bool matched;
  final Participant mentor;
  final Participant mentee;
  final String subject;
  final String notes;
  final AppointmentType appointmentType;

  Appointment(
      {@required this.id,
      @required this.start,
      @required this.end,
      @required this.matched,
      @required this.mentor,
      @required this.mentee,
      @required this.subject,
      @required this.notes,
      @required this.appointmentType});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this.id;
    map['mentor'] = this.mentor?.id ?? '';
    map['mentee'] = this.mentee?.id ?? '';
    map['notes'] = this.notes;
    map['subject'] = this.subject;
    map['matched'] = this.matched ? 1 : 0;
    map['start'] = this.start ?? this.start.toUtc().millisecondsSinceEpoch;
    map['end'] = this.end ?? this.end.toUtc().millisecondsSinceEpoch;
    map['appointmentType']=this.appointmentType.index;
    return map;
  }

 factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      id: map['id'],
      mentor: map['mentor'],
      mentee: map['mentee'],
      notes: map['notes'],
      subject: map['subject'],
      matched: map['matched'] == 1 ? true : false,
      start:  DateTime.fromMillisecondsSinceEpoch( map['start'] as int),
      end:  DateTime.fromMillisecondsSinceEpoch( map['end'] as int),
      appointmentType: AppointmentType.values[(map['appointmentType'] as int)]
    );
  }
}

enum AppointmentType { giveHelp, needHelp }
