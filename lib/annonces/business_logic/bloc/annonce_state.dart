part of 'annonce_bloc.dart';

sealed class AnnonceState extends Equatable {
  const AnnonceState();

  @override
  List<Object> get props => [];
}

final class AnnonceInitial extends AnnonceState {}

class AnnonceLoading extends AnnonceState {}

class AnnonceLoaded extends AnnonceState {
  final List<AnnounceModel> annonces;

  const AnnonceLoaded(this.annonces);

  @override
  List<Object> get props => [annonces];
}

class AnnonceError extends AnnonceState {
  final String messages;
  const AnnonceError(this.messages);

  @override
  List<Object> get props => [messages];
}
