part of 'announce_list_bloc.dart';

sealed class AnnounceListState extends Equatable {
  final PaginatedData<AnnounceModel>? announces;
  const AnnounceListState({
    this.announces,
  });

  @override
  List<Object?> get props => [announces];
}

final class AnnounceListInitial extends AnnounceListState {}

final class FetchAnnounceListLoading extends AnnounceListState {
  const FetchAnnounceListLoading({super.announces});
}

final class FetchAnnounceListSuccess extends AnnounceListState {
  const FetchAnnounceListSuccess({super.announces});
}

final class FetchAnnounceListFailure extends AnnounceListState {
  final String message;
  const FetchAnnounceListFailure({
    required this.message,
    super.announces,
  });
}
