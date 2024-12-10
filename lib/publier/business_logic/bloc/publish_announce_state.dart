import 'package:equatable/equatable.dart';

abstract class PublishAnnonceState extends Equatable {
  @override
  List<Object> get props => [];
}

class PublishAnnonceInitial extends PublishAnnonceState {}

class PublishAnnonceLoading extends PublishAnnonceState {}

class PublishAnnonceSuccess extends PublishAnnonceState {
  final String message;

  PublishAnnonceSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class PublishAnnonceError extends PublishAnnonceState {
  final String errorMessage;

  PublishAnnonceError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}