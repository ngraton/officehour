import 'package:officehour/providers/providers_lib.dart';
import 'package:officehour/repositories/repositories_lib.dart';

import 'blocs_lib.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final AppointmentRepository _appointmentRepository;
  AppointmentBloc({@required AppointmentRepository appointmentRepository})
      : _appointmentRepository = appointmentRepository;
  @override
  AppointmentState get initialState => InitialAppointmentState();

  @override
  Stream<AppointmentState> mapEventToState(
    AppointmentEvent event,
  ) async* {
    if (event is LoadAppointment) {
      yield AppointmentsLoading();
      var appointemnt = await _appointmentRepository.get(event.id);
      yield AppointmentLoaded(appointment: appointemnt);
    }
    if (event is GetParticipantAppointments) {}
  }
}
