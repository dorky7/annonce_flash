// ignore_for_file: public_member_api_docs, sort_constructors_first
class AnnounceQueryFilter {
  final int perPage;
  final String? op;
  final int? page;

  AnnounceQueryFilter({
    this.perPage = 12,
    this.op = 'latest',
    this.page,
  });

  String build() {
    String path = '?perPage=$perPage';
    if (op != null) {
      path = "$path&op=$op";
    }
    if (page != null) {
      path = "$path&page=$page";
    }

    return path;
  }

  AnnounceQueryFilter copyWith({
    int? perPage,
    String? op,
    int? page,
  }) {
    return AnnounceQueryFilter(
      perPage: perPage ?? this.perPage,
      op: op ?? this.op,
      page: page ?? this.page,
    );
  }
}
