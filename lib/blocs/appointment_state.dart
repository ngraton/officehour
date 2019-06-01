import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/models_lib.dart';
import 'blocs_lib.dart';

@immutable
abstract class AppointmentState extends Equatable {
  AppointmentState([List props = const []]) : super(props);
}

class InitialAppointmentState extends AppointmentState {}

class AppointmentLoaded extends AppointmentState {
  final Appointment appointment;
  AppointmentLoaded({@required this.appointment}) : super([appointment]);
}
class AppointmentsLoading extends AppointmentState{

}

