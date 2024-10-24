// ignore_for_file: public_member_api_docs, sort_constructors_first
class AnnounceQueryFilter {
  final int perPage;
  final String? op;

  AnnounceQueryFilter({
    this.perPage = 12,
    this.op = 'latest',
  });

  String build() {
    String path = '?perPage=$perPage';
    if (op != null) {
      path = "$path&op=$op";
    }

    return path;
  }
}
