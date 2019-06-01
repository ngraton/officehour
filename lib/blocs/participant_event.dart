import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:officehour/models/models_lib.dart';
import 'package:officehour/providers/providers_lib.dart';
import 'blocs_lib.dart';

@immutable
abstract class ParticipantEvent extends Equatable {
  ParticipantEvent([List props = const []]) : super(props);
}

class LoadParticipant extends ParticipantEvent {
  final String id;
  LoadParticipant({@required this.id}) : super([id]);
}

class AddParticipant extends ParticipantEvent {
  final Participant participant;
  AddParticipant({@required this.participant}) : super([participant]);
}

class GetAllParticipants extends ParticipantEvent {}
