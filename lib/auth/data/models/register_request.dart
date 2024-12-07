// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class RegisterRequest {
  final String name;
  final String country_code;
  final String auth_field;
  final String password;
  final String email;
  final String password_confirmation;
  final String? create_from_ip;
  final int accept_terms;

  RegisterRequest({
    required this.name,
    required this.country_code,
    this.auth_field = 'email',
    required this.password,
    required this.email,
    required this.password_confirmation,
    required this.accept_terms,
    this.create_from_ip,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'country_code': country_code,
      'auth_field': auth_field,
      'password': password,
      'email': email,
      'password_confirmation': password_confirmation,
      'create_from_ip': create_from_ip,
      'accept_terms': accept_terms,
    };
  }

  RegisterRequest copyWith({
    String? name,
    String? country_code,
    String? auth_field,
    String? password,
    String? email,
    String? password_confirmation,
    String? create_from_ip,
    int? accept_terms,
  }) {
    return RegisterRequest(
      name: name ?? this.name,
      country_code: country_code ?? this.country_code,
      auth_field: auth_field ?? this.auth_field,
      password: password ?? this.password,
      email: email ?? this.email,
      password_confirmation:
          password_confirmation ?? this.password_confirmation,
      create_from_ip: create_from_ip ?? this.create_from_ip,
      accept_terms: accept_terms ?? this.accept_terms,
    );
  }
}
