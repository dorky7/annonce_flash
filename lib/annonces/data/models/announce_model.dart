// ignore_for_file: public_member_api_docs, sort_constructors_first
class AnnounceModel {
  int id;
  String countryCode;
  int userId;
  int? paymentId;
  int categoryId;
  int? postTypeId;
  String title;
  String excerpt;
  String description;
  List<String> tags;
  String price;
  String currencyCode;
  int negotiable;
  String contactName;
  String authField;
  String email;
  String phone;
  String phoneNational;
  String phoneCountry;
  bool? phoneHidden;
  String? address;
  int cityId;
  double lat;
  double lon;
  String createFromIp;
  String? latestUpdateIp;
  int visits;
  String tmpToken;
  String? emailToken;
  String? phoneToken;
  DateTime? emailVerifiedAt;
  DateTime? phoneVerifiedAt;
  int acceptTerms;
  int acceptMarketingOffers;
  int isPermanent;
  DateTime? reviewedAt;
  int featured;
  DateTime? archivedAt;
  DateTime? archivedManuallyAt;
  DateTime? deletionMailSentAt;
  String? fbProfile;
  String? partner;
  DateTime? createdAt;
  DateTime? updatedAt;
  int reference;
  String slug;
  String url;
  String phoneIntl;
  String createdAtFormatted;
  String userPhotoUrl;
  String countryFlagUrl;
  String priceLabel;
  String priceFormatted;
  String visitsFormatted;
  String? distanceInfo;
  int countPictures;
  Picture picture;
  AnnounceModel({
    required this.id,
    required this.countryCode,
    required this.userId,
    this.paymentId,
    required this.categoryId,
    this.postTypeId,
    required this.title,
    required this.excerpt,
    required this.description,
    required this.tags,
    required this.price,
    required this.currencyCode,
    required this.negotiable,
    required this.contactName,
    required this.authField,
    required this.email,
    required this.phone,
    required this.phoneNational,
    required this.phoneCountry,
    this.phoneHidden,
    this.address,
    required this.cityId,
    required this.lat,
    required this.lon,
    required this.createFromIp,
    this.latestUpdateIp,
    required this.visits,
    required this.tmpToken,
    this.emailToken,
    this.phoneToken,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    required this.acceptTerms,
    required this.acceptMarketingOffers,
    required this.isPermanent,
    this.reviewedAt,
    required this.featured,
    this.archivedAt,
    this.archivedManuallyAt,
    this.deletionMailSentAt,
    this.fbProfile,
    this.partner,
    this.createdAt,
    this.updatedAt,
    required this.reference,
    required this.slug,
    required this.url,
    required this.phoneIntl,
    required this.createdAtFormatted,
    required this.userPhotoUrl,
    required this.countryFlagUrl,
    required this.priceLabel,
    required this.priceFormatted,
    required this.visitsFormatted,
    this.distanceInfo,
    required this.countPictures,
    required this.picture,
  });

  factory AnnounceModel.fromJson(Map<String, dynamic> json) {
    return AnnounceModel(
      id: json['id'],
      countryCode: json['country_code'],
      userId: json['user_id'],
      paymentId: json['payment_id'],
      categoryId: json['category_id'],
      postTypeId: json['post_type_id'],
      title: json['title'],
      excerpt: json['excerpt'],
      description: json['description'],
      tags: List<String>.from((json['tags'] as List)),
      price: json['price'],
      currencyCode: json['currency_code'],
      negotiable: json['negotiable'],
      contactName: json['contactName'],
      authField: json['authField'],
      email: json['email'],
      phone: json['phone'],
      phoneNational: json['phone_national'],
      phoneCountry: json['phone_country'],
      phoneHidden: json['phone_hidden'],
      address: json['address'],
      cityId: json['city_id'],
      lat: json['lat'],
      lon: json['lon'],
      createFromIp: json['create_from_ip'],
      latestUpdateIp: json['latest_update_ip'],
      visits: json['visits'],
      tmpToken: json['tmp_token'],
      emailToken: json['email_token'],
      phoneToken: json['phone_token'],
      emailVerifiedAt: DateTime.tryParse(json['email_verified_at']),
      phoneVerifiedAt: DateTime.tryParse(json['phone_verified_at']),
      acceptTerms: json['accept_terms'],
      acceptMarketingOffers: json['accept_marketing_offers'],
      isPermanent: json['is_permanent'],
      reviewedAt: DateTime.tryParse(json['reviewed_at']),
      featured: json['featured'],
      archivedAt: json['archived_at'] != null
          ? DateTime.tryParse(json['archived_at'])
          : null,
      archivedManuallyAt: json['archived_manually_at'] != null
          ? DateTime.tryParse(json['archived_manually_at'])
          : null,
      deletionMailSentAt: json['deletion_mail_sent_at'] != null
          ? DateTime.tryParse(json['deletion_mail_sent_at'])
          : null,
      fbProfile: json['fb_profile'],
      partner: json['partner'],
      createdAt: DateTime.tryParse(json['created_at']),
      updatedAt: DateTime.tryParse(json['updated_at']),
      reference: json['reference'],
      slug: json['slug'],
      url: json['url'],
      phoneIntl: json['phone_intl'],
      createdAtFormatted: json['created_at_formatted'],
      userPhotoUrl: json['user_photo_url'],
      countryFlagUrl: json['country_flag_url'],
      priceLabel: json['price_label'],
      priceFormatted: json['price_formatted'],
      visitsFormatted: json['visits_formatted'],
      distanceInfo: json['distance_info'],
      countPictures: json['countPictures'],
      picture: Picture.fromJson(json['picture']),
    );
  }
}

class Picture {
  final String filename;
  final PictureUrl url;

  const Picture({
    required this.filename,
    required this.url,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      filename: json['filename'],
      url: PictureUrl.fromJson(json['url']),
    );
  }
}

class PictureUrl {
  final String full;
  final String small;
  final String medium;
  final String large;

  const PictureUrl({
    required this.full,
    required this.small,
    required this.medium,
    required this.large,
  });

  factory PictureUrl.fromJson(Map<String, dynamic> json) {
    return PictureUrl(
      full: json['full'],
      small: json['small'],
      medium: json['medium'],
      large: json['large'],
    );
  }
}
