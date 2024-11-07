class UserModel {
  int id;
  String name;
  String? username;
  DateTime updatedAt;
  DateTime originalUpdatedAt;
  DateTime? originalLastActivity;
  String createdAtFormatted;
  String photoUrl;
  bool isOnline;
  String countryFlagUrl;
  String countryCode;
  String languageCode;
  int userTypeId;
  int genderId;
  String? photo;
  String? about;
  String authField;
  String email;
  String phone;
  String phoneNational;
  String phoneCountry;
  int phoneHidden;
  int disableComments;
  String? createFromIp;
  String? latestUpdateIp;
  String? provider;
  String? providerId;
  String? emailToken;
  String? phoneToken;
  DateTime? emailVerifiedAt;
  DateTime? phoneVerifiedAt;
  int acceptTerms;
  int acceptMarketingOffers;
  int darkMode;
  String? timeZone;
  int featured;
  int blocked;
  int closed;
  DateTime lastActivity;
  String phoneIntl;

  UserModel({
    required this.id,
    required this.name,
    this.username,
    required this.updatedAt,
    required this.originalUpdatedAt,
    this.originalLastActivity,
    required this.createdAtFormatted,
    required this.photoUrl,
    required this.isOnline,
    required this.countryFlagUrl,
    required this.countryCode,
    required this.languageCode,
    required this.userTypeId,
    required this.genderId,
    this.photo,
    this.about,
    required this.authField,
    required this.email,
    required this.phone,
    required this.phoneNational,
    required this.phoneCountry,
    required this.phoneHidden,
    required this.disableComments,
    this.createFromIp,
    this.latestUpdateIp,
    this.provider,
    this.providerId,
    this.emailToken,
    this.phoneToken,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    required this.acceptTerms,
    required this.acceptMarketingOffers,
    required this.darkMode,
    this.timeZone,
    required this.featured,
    required this.blocked,
    required this.closed,
    required this.lastActivity,
    required this.phoneIntl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      updatedAt: DateTime.parse(json['updated_at']),
      originalUpdatedAt: DateTime.parse(json['original_updated_at']),
      originalLastActivity: json['original_last_activity'] != null
          ? DateTime.parse(json['original_last_activity'])
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
          ? DateTime.parse(json['email_verified_at'])
          : null,
      phoneVerifiedAt: json['phone_verified_at'] != null
          ? DateTime.parse(json['phone_verified_at'])
          : null,
      acceptTerms: json['accept_terms'],
      acceptMarketingOffers: json['accept_marketing_offers'],
      darkMode: json['dark_mode'],
      timeZone: json['time_zone'],
      featured: json['featured'],
      blocked: json['blocked'],
      closed: json['closed'],
      lastActivity: DateTime.parse(json['last_activity']),
      phoneIntl: json['phone_intl'],
    );
  }
}
