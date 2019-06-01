import 'package:meta/meta.dart';
import 'package:officehour/models/models_lib.dart';
import 'package:officehour/providers/providers_lib.dart';

class ParticipantRepository {
  final ParticipantProvider _participantProvider;

  ParticipantRepository({@required ParticipantProvider participantProvider})
      : _participantProvider = participantProvider;

      void save ({@required Participant participant}) async {
        await _participantProvider.save(participant);
      }

      Future<Participant> get(String id) async {
        return await _participantProvider.get(id);
      }
}
