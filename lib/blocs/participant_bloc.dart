import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../repositories/repositories_lib.dart';
import 'blocs_lib.dart';

class ParticipantBloc extends Bloc<ParticipantEvent, ParticipantState> {
  final ParticipantRepository _repository;

  ParticipantBloc({@required ParticipantRepository repository})
      : _repository = repository;

  @override
  ParticipantState get initialState => InitialParticipantState();

  @override
  Stream<ParticipantState> mapEventToState(
    ParticipantEvent event,
  ) async* {
    if (event is LoadParticipant) {
      yield ParticipantLoading();
      var participant = await _repository.get(event.id);
      yield ParticipantLoaded(participant: participant);
    }

    if (event is AddParticipant) {}
    if (event is GetAllParticipants) {}
  }
}
