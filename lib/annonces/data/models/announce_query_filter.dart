// ignore_for_file: public_member_api_docs, sort_constructors_first
class AnnounceModel {
  final int perPage;
  final String? op;

  AnnounceModel({
    this.perPage = 12,
    this.op,
  });

  String build() {
    String path = '?perPage=$perPage';
    if (op != null) {
      path = "$path&op=$op";
    }

    return path;
  }
}
