class CategoryModel {
  final int id;
  final int? parentId;
  final String name;
  final String? slug;
  final String? description;
  final String? hideDescription;
  final String? picture;
  final String? iconClass;
  final String? seoTitle;
  final String? seoDescription;
  final String? seoKeywords;
  final int? lft;
  final int? rgt;
  final int? depth;
  final String? type;
  final int? isForPermanent;
  final int? active;
  final String? pictureUrl;
  final String? parentClosure;

  CategoryModel({
    required this.id,
    this.parentId,
    required this.name,
    this.slug,
    this.description,
    this.hideDescription,
    this.picture,
    this.iconClass,
    this.seoTitle,
    this.seoDescription,
    this.seoKeywords,
    this.lft,
    this.rgt,
    this.depth,
    this.type,
    this.isForPermanent,
    this.active,
    this.pictureUrl,
    this.parentClosure,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      parentId: json['parent_id'],
      name: json['name'],
      slug: json['slug'],
      description: json['description'],
      hideDescription: json['hide_description'],
      picture: json['picture'],
      iconClass: json['icon_class'],
      seoTitle: json['seo_title'],
      seoDescription: json['seo_description'],
      seoKeywords: json['seo_keywords'],
      lft: json['lft'],
      rgt: json['rgt'],
      depth: json['depth'],
      type: json['type'],
      isForPermanent: json['is_for_permanent'],
      active: json['active'],
      pictureUrl: json['picture_url'],
      parentClosure: json['parentClosure'],
    );
  }
}
