import 'infrastructure_lib.dart';

class DbDefinitions {
  static Map<String, String> _definitions; // = Map<String, String>();

  static String pariticpantsCreateCommand = "CREATE TABLE $participantTable ("
      "id TEXT PRIMARY KEY, "
      "name TEXT, "
      ")";

  static String appointmentsCreateCommand = "CREATE TABLE $appointmentTable ("
      "id TEXT PRIMARY KEY, "
      "mentorId TEXT not NULL, "
      "menteeId TEXT, "
      "subject TEXT, "
      "notes TEXT, "
      "matched INT, "
      "appoinmentType INT,"
      "start INT,"
      "end INT,"
      "FOREIGN KEY (mentorId) REFERENCES $participantTable(id),"
      "FOREIGN KEY (menteeeId) REFERENCES $participantTable(id)"
      ")";

  String get pt => participantTable;
  String get at => appointmentTable;

  Map<String, String> get definitions {
    if (_definitions == null) {
      _definitions = Map<String, String>();
      _definitions[participantTable] = pariticpantsCreateCommand;
      _definitions[appointmentTable] = appointmentsCreateCommand;
    }
    return _definitions;
  }
}
