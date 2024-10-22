// ignore_for_file: public_member_api_docs, sort_constructors_first
class AnnonceQueryFilter {
  final int limit;
  final String? search;
  final int? skip;
  final String? sortBy;
  final String order;
  final String? category;
  final DateTime? startDate;
  final DateTime? endDate;

  AnnonceQueryFilter({
    this.limit = 20,
    this.order = 'asc',
    this.search,
    this.skip,
    this.sortBy,
    this.category,
    this.startDate,
    this.endDate,
  });

  AnnonceQueryFilter copyWith({
    int? limit,
    String? search,
    int? skip,
    String? sortBy,
    String? order,
    String? category,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return AnnonceQueryFilter(
      limit: limit ?? this.limit,
      search: search ?? this.search,
      skip: skip ?? this.skip,
      sortBy: sortBy ?? this.sortBy,
      order: order ?? this.order,
      category: category ?? this.category,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
