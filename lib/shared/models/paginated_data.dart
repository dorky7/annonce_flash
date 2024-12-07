// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaginatedData<T> {
  late int? currentPage;
  late int? from;
  late int? lastPage;
  late int? perPage;
  late int? to;
  late int? total;
  late List<T> data;

  PaginatedData({
    this.currentPage,
    this.from,
    this.lastPage,
    this.perPage,
    this.to,
    this.total,
    required this.data,
  });

  factory PaginatedData.fromJson({
    required Map<String, dynamic> json,
    required T Function(Map<String, dynamic> json) fromJsonT,
  }) {
    return PaginatedData(
      currentPage: json['meta']['current_page'],
      from: json['meta']['from'],
      to: json['meta']['to'],
      total: json['meta']['total'],
      perPage: json['meta']['per_page'],
      lastPage: json['meta']['last_page'],
      data: json['data'] != null
          ? List.from(json['data'].map((j) => fromJsonT(j)))
          : [],
    );
  }

  get length => null;
}
