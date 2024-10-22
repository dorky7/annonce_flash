part of 'annonce_bloc.dart';

sealed class AnnonceEvent extends Equatable {
  const AnnonceEvent();

  @override
  List<Object> get props => [];
}

class fetchAnnonces extends AnnonceEvent {}
