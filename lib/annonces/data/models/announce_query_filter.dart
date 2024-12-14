// ignore_for_file: public_member_api_docs, sort_constructors_first
class AnnounceQueryFilter {
  final int perPage;
  final String? op;
  final int? page;
  final int? postId;

  AnnounceQueryFilter({
    this.perPage = 12,
    this.op = 'latest',
    this.page,
    this.postId,
  });

  String build() {
    String path = '?perPage=$perPage';
    if (op != null) {
      path = "$path&op=$op";
    }
    if (page != null) {
      path = "$path&page=$page";
    }
    if (op == 'similar' && postId != null) {
      path = "$path&postId=$postId";
    }

    return path;
  }

  AnnounceQueryFilter copyWith({
    int? perPage,
    String? op,
    int? page,
    int? postId,
  }) {
    return AnnounceQueryFilter(
      perPage: perPage ?? this.perPage,
      op: op ?? this.op,
      page: page ?? this.page,
      postId: postId ?? this.postId,
    );
  }
}
