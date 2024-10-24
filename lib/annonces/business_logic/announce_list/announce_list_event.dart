part of 'announce_list_bloc.dart';

sealed class AnnounceListEvent extends Equatable {
  const AnnounceListEvent();

  @override
  List<Object> get props => [];
}

final class FetchAnnounceListEvent extends AnnounceListEvent {
  final AnnounceQueryFilter filter;

  const FetchAnnounceListEvent({required this.filter});
}
