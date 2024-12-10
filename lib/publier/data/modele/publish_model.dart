class PublishModel {
  final int categoryId;
  final String title;
  final String description;
  final String contactName;
  final String? phone;
  final String? phoneCountry;
  final int? cityId;
  final List<String>? pictures;
  final String? email;
  final String? countryCode;
  final int? postTypeId;
  final String? adminCode;
  final int? price;
  final bool? negotiable;
  final bool? phoneHidden;
  final String? createFromIp;
  final bool? acceptMarketingOffers;
  final bool? isPermanent;
  final String? tags;
  final bool acceptTerms;
  final int? packageId;
  final int? paymentMethodId;

  PublishModel({
    required this.categoryId,
    required this.title,
    required this.description,
    required this.contactName,
    this.phone,
     this.phoneCountry,
     this.cityId,
    this.pictures,
    this.email,
     this.countryCode,
    this.postTypeId,
    this.adminCode,
     this.price,
    this.negotiable,
    this.phoneHidden,
    this.createFromIp,
    this.acceptMarketingOffers,
    this.isPermanent,
    this.tags,
    required this.acceptTerms,
     this.packageId,
    this.paymentMethodId,
  });

  factory PublishModel.fromJson(Map<String, dynamic> json) {
    return PublishModel(
      categoryId: json['categoryId'],
      title: json['title'],
      description: json['description'],
      contactName: json['contactName'],
      phone: json['phone'],
      phoneCountry: json['phoneCountry'],
      cityId: json['cityId'],
      pictures: json['pictures']?.cast<String>(),
      email: json['email'],
      countryCode: json['countryCode'],
      postTypeId: json['postTypeId'],
      adminCode: json['adminCode'],
      price: json['price'],
      negotiable: json['negotiable'],
      phoneHidden: json['phoneHidden'],
      createFromIp: json['createFromIp'],
      acceptMarketingOffers: json['acceptMarketingOffers'],
      isPermanent: json['isPermanent'],
      tags: json['tags'],
      acceptTerms: json['acceptTerms'],
      packageId: json['packageId'],
      paymentMethodId: json['paymentMethodId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'title': title,
      'description': description,
      'contactName': contactName,
      'phone': phone,
      'phoneCountry': phoneCountry,
      'cityId': cityId,
      'pictures': pictures,
      'email': email,
      'countryCode': countryCode,
      'postTypeId': postTypeId,
      'adminCode': adminCode,
      'price': price,
      'negotiable': negotiable,
      'phoneHidden': phoneHidden,
      'createFromIp': createFromIp,
      'acceptMarketingOffers': acceptMarketingOffers,
      'isPermanent': isPermanent,
      'tags': tags,
      'acceptTerms': acceptTerms,
      'packageId': packageId,
      'paymentMethodId': paymentMethodId,
    };
  }
}