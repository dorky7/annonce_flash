import 'package:annonceflash_project/auth/business_logic/bloc/auth_bloc.dart';
import 'package:annonceflash_project/auth/presentation/app_button.dart';
import 'package:annonceflash_project/auth/presentation/app_text_field.dart';
import 'package:annonceflash_project/auth/presentation/pages/register/register_screen.dart';
import 'package:annonceflash_project/shared/routes/app_router.gr.dart';
import 'package:annonceflash_project/shared/widgets/app_snackbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void showLoading() {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  void showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          context.loaderOverlay.hide();
          AppSnackBar.showError(
            message: state.message,
            context: context,
            duration: const Duration(seconds: 10),
          );
        }
        if (state is LoginLoading) {
          context.loaderOverlay.show();
        }
        if (state is LoginSuccess) {
          context.loaderOverlay.hide();
          context.router.pushAndPopUntil(
            const ApplicationRoute(),
            predicate: (route) => false,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
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
                      hinText: 'Email',
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    AppTextfield(
                      controller: passwordController,
                      hinText: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: AppButton(
                        onTap: () {
                          context.read<AuthBloc>().add(
                                LoginEvent(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                        },
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            context.router.push(
                              const RegisterRoute(),
                            );
                          },
                          child: const Text(
                            'Register now',
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
        );
      },
    );
  }
}
