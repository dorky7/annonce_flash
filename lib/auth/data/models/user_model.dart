class UserModel {
  int id;
  String? name;
  String? username;
  DateTime? updatedAt;
  DateTime? originalUpdatedAt;
  DateTime? originalLastActivity;
  String? createdAtFormatted;
  String? photoUrl;
  bool? isOnline;
  String? countryFlagUrl;
  String? countryCode;
  String? languageCode;
  int? userTypeId;
  int? genderId;
  String? photo;
  String? about;
  String? authField;
  String? email;
  String? phone;
  String? phoneNational;
  String? phoneCountry;
  int? phoneHidden;
  int? disableComments;
  String? createFromIp;
  String? latestUpdateIp;
  String? provider;
  String? providerId;
  String? emailToken;
  String? phoneToken;
  DateTime? emailVerifiedAt;
  DateTime? phoneVerifiedAt;
  dynamic acceptTerms;
  int? acceptMarketingOffers;
  int? darkMode;
  String? timeZone;
  int? featured;
  int? blocked;
  int? closed;
  DateTime? lastActivity;
  String? phoneIntl;

  UserModel({
    required this.id,
    this.name,
    this.username,
    this.updatedAt,
    this.originalUpdatedAt,
    this.originalLastActivity,
    this.createdAtFormatted,
    this.photoUrl,
    this.isOnline,
    this.countryFlagUrl,
    this.countryCode,
    this.languageCode,
    this.userTypeId,
    this.genderId,
    this.photo,
    this.about,
    this.authField,
    this.email,
    this.phone,
    this.phoneNational,
    this.phoneCountry,
    this.phoneHidden,
    this.disableComments,
    this.createFromIp,
    this.latestUpdateIp,
    this.provider,
    this.providerId,
    this.emailToken,
    this.phoneToken,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    this.acceptTerms,
    this.acceptMarketingOffers,
    this.darkMode,
    this.timeZone,
    this.featured,
    this.blocked,
    this.closed,
    this.lastActivity,
    this.phoneIntl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      originalUpdatedAt: json['original_updated_at'] != null
          ? DateTime.parse(json['original_updated_at'])
          : null,
      originalLastActivity: json['original_last_activity'] != null
          ? DateTime.tryParse(json['original_last_activity'])
          : null,
      createdAtFormatted: json['created_at_formatted'],
      photoUrl: json['photo_url'],
      isOnline: json['p_is_online'],
      countryFlagUrl: json['country_flag_url'],
      countryCode: json['country_code'],
      languageCode: json['language_code'],
      userTypeId: json['user_type_id'],
      genderId: json['gender_id'],
      photo: json['photo'],
      about: json['about'],
      authField: json['auth_field'],
      email: json['email'],
      phone: json['phone'],
      phoneNational: json['phone_national'],
      phoneCountry: json['phone_country'],
      phoneHidden: json['phone_hidden'],
      disableComments: json['disable_comments'],
      createFromIp: json['create_from_ip'],
      latestUpdateIp: json['latest_update_ip'],
      provider: json['provider'],
      providerId: json['provider_id'],
      emailToken: json['email_token'],
      phoneToken: json['phone_token'],
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.tryParse(json['email_verified_at'])
          : null,
      phoneVerifiedAt: json['phone_verified_at'] != null
          ? DateTime.tryParse(json['phone_verified_at'])
          : null,
      acceptTerms: json['accept_terms'],
      acceptMarketingOffers: json['accept_marketing_offers'],
      darkMode: json['dark_mode'],
      timeZone: json['time_zone'],
      featured: json['featured'],
      blocked: json['blocked'],
      closed: json['closed'],
      lastActivity: json['last_activity'] != null
          ? DateTime.tryParse(json['last_activity'])
          : null,
      phoneIntl: json['phone_intl'],
    );
  }
}
