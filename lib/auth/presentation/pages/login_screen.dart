import 'package:annonceflash_project/auth/business_logic/bloc/auth_bloc.dart';
import 'package:annonceflash_project/auth/presentation/my_button.dart';
import 'package:annonceflash_project/auth/presentation/my_text_field.dart';
import 'package:annonceflash_project/shared/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  const LoginScreen({super.key, required this.onTap});

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
          showError('Incorrect credentials');
        } else if (state is LoginSuccess) {
          context.router.push(const ProfileRoute());  // Adjust navigation to ProfileScreen
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
                    MyTextfield(
                      controller: emailController,
                      hinText: 'Email',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    MyTextfield(
                      controller: passwordController,
                      hinText: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    if (state is! LoginLoading)
                      MyButton(
                        onTap: () {
                          context.read<AuthBloc>().add(
                                LoginEvent(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                        },
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
                         onTap: widget.onTap,
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
