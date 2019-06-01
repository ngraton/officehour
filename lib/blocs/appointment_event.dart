import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/models_lib.dart';
import 'blocs_lib.dart';

@immutable
abstract class AppointmentEvent extends Equatable {
  AppointmentEvent([List props = const []]) : super(props);
}

class LoadAppointment extends AppointmentEvent {
  final String id;
  LoadAppointment({@required this.id}) : super([id]);
}

class AddAppointment extends AppointmentEvent {
  final Appointment appointment;
  AddAppointment({@required this.appointment});
}

class GetParticipantAppointments extends AppointmentEvent {
  final String participantId;
  GetParticipantAppointments({@required this.participantId})
      : super([participantId]);
}
