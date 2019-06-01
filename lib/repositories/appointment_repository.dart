import 'package:meta/meta.dart';
import '../models/models_lib.dart';
import '../providers/providers_lib.dart';

class AppointmentRepository {
  final AppointmentProvider _appointmentProvider;
  AppointmentRepository({@required AppointmentProvider appointmentProvider})
      : _appointmentProvider = appointmentProvider;

  void save({@required Appointment appointment}) async {
    await _appointmentProvider.save(appointment);
  }

  Future<Appointment> get(String id) async {
    return await _appointmentProvider.get(id);
  }
}
