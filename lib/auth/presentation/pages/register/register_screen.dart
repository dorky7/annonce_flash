import 'package:annonceflash_project/auth/business_logic/bloc/auth_bloc.dart';
import 'package:annonceflash_project/auth/data/models/register_request.dart';
import 'package:annonceflash_project/auth/presentation/app_button.dart';
import 'package:annonceflash_project/auth/presentation/app_text_field.dart';
import 'package:annonceflash_project/main.dart';
import 'package:annonceflash_project/shared/extensions/context_extensions.dart';
import 'package:annonceflash_project/shared/routes/app_router.gr.dart';
import 'package:annonceflash_project/shared/theme/app_colors.dart';
import 'package:annonceflash_project/shared/widgets/app_snackbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:loader_overlay/loader_overlay.dart';

/* 
   name
   country_code   
   auth_field: email or phone
   password   
   accept_terms   
   email   
   password_confirmation   
   create_from_ip   
*/

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController countryController;
  late TextEditingController confirmPasswordController;
  bool acceptTerms = false;
  Country? _country;
  final _formKey = GlobalKey<FormState>();
  String pwd = '';

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    countryController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    countryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is SignUpFailure) {
          context.loaderOverlay.hide();
          AppSnackBar.showError(
            message: state.message,
            context: context,
          );
        }
        if (state is SignUpLoading) {
          context.loaderOverlay.show();
        }
        if (state is SignUpSuccess) {
          context.loaderOverlay.hide();
          await AppSnackBar.showSuccess(
            message:
                "Un lien d'activation vous a été envoyé pour vérifier votre adresse email.",
            context: context,
            duration: const Duration(seconds: 5),
          );
          context.router.popForced();
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.lock, size: 100),
                      const SizedBox(height: 50),
                      Text(
                        'Welcome back, you\'ve been missed!',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 25),
                      AppTextfield(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        hinText: 'Email',
                        obscureText: false,
                        autofillHints: [
                          AutofillHints.email,
                        ],
                        validators: [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ],
                      ),
                      const SizedBox(height: 20),
                      AppTextfield(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        autofillHints: [
                          AutofillHints.name,
                        ],
                        hinText: 'Name',
                        obscureText: false,
                        validators: [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      const SizedBox(height: 20),
                      AppTextfield(
                        controller: countryController,
                        hinText: 'Country',
                        validators: [
                          FormBuilderValidators.required(),
                        ],
                        keyboardType: TextInputType.none,
                        // readOnly: true,
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            showPhoneCode: true,
                            countryListTheme: CountryListThemeData(
                              bottomSheetHeight: context.height * .7,
                            ),
                            onSelect: (Country country) {
                              setState(() {
                                _country = country;
                                countryController.text = country.name;
                              });
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      AppTextfield(
                        controller: passwordController,
                        autofillHints: [
                          AutofillHints.password,
                        ],
                        keyboardType: TextInputType.visiblePassword,
                        hinText: 'Password',
                        onChanged: (value) {
                          setState(() {
                            pwd = value;
                          });
                        },
                        validators: [
                          FormBuilderValidators.required(),
                        ],
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      AppTextfield(
                        validators: [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.equal(pwd),
                        ],
                        keyboardType: TextInputType.visiblePassword,
                        controller: confirmPasswordController,
                        hinText: 'Confirm Password',
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          children: [
                            CupertinoCheckbox(
                              value: acceptTerms,
                              activeColor: AppColors.primary,
                              onChanged: (value) {
                                setState(() {
                                  acceptTerms = !acceptTerms;
                                });
                              },
                            ),
                            const Flexible(
                              child: Text(
                                "J'ai lu et j'accepte les Termes & Conditions d'utilisation",
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      if (state is! SignUpLoading)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: AppButton(
                            onTap: () {
                              if (acceptTerms != true) {
                                AppSnackBar.showError(
                                  message:
                                      "Veuillez d'abord accepter nos conditions générales",
                                  context: context,
                                );
                                return;
                              }

                              if (_formKey.currentState?.validate() ?? false) {
                                context.read<AuthBloc>().add(
                                      SignUpEvent(
                                        request: RegisterRequest(
                                          name: nameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          password_confirmation:
                                              confirmPasswordController.text,
                                          country_code:
                                              _country?.countryCode ?? '',
                                          accept_terms: 1,
                                        ),
                                      ),
                                    );
                              }
                            },
                          ),
                        ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              context.router.popForced();
                            },
                            child: const Text(
                              'Login now',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
