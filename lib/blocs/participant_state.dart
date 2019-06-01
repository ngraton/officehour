import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:officehour/models/models_lib.dart';
import 'blocs_lib.dart';

@immutable
abstract class ParticipantState extends Equatable {
  ParticipantState([List props = const []]) : super(props);
}

class InitialParticipantState extends ParticipantState {}

class ParticipantLoaded extends ParticipantState {
  final Participant participant;
  ParticipantLoaded({@required this.participant});
}

class ParticipantLoading extends ParticipantState {}

class ParticipantsLoaded extends ParticipantState {
  final List<Participant> participants;
  ParticipantsLoaded({@required this.participants});
}
