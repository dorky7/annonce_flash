class CategoryModel {
  final int id;
  final int? parentId;
  final String name;
  final String slug;
  final String description;
  final String? hideDescription;
  final String picture;
  final String iconClass;
  final String seoTitle;
  final String seoDescription;
  final String seoKeywords;
  final int lft;
  final int rgt;
  final int depth;
  final String type;
  final int isForPermanent;
  final int active;
  final String pictureUrl;
  final String? parentClosure;

  CategoryModel({
    required this.id,
    this.parentId,
    required this.name,
    required this.slug,
    required this.description,
    this.hideDescription,
    required this.picture,
    required this.iconClass,
    required this.seoTitle,
    required this.seoDescription,
    required this.seoKeywords,
    required this.lft,
    required this.rgt,
    required this.depth,
    required this.type,
    required this.isForPermanent,
    required this.active,
    required this.pictureUrl,
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

class Links {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  Links({this.first, this.last, this.prev, this.next});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      first: json['first'],
      last: json['last'],
      prev: json['prev'],
      next: json['next'],
    );
  }
}

class Meta {
  final int currentPage;
  final int from;
  final int lastPage;
  final List<PageLink>? links;
  final String path;
  final int perPage;
  final int to;
  final int total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json['current_page'],
      from: json['from'],
      lastPage: json['last_page'],
      links: (json['links'] as List?)?.map((item) => PageLink.fromJson(item)).toList(),
      path: json['path'],
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class PageLink {
  final String? url;
  final String label;
  final bool active;

  PageLink({this.url, required this.label, required this.active});

  factory PageLink.fromJson(Map<String, dynamic> json) {
    return PageLink(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
}
