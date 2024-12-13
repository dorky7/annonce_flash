import 'package:annonceflash_project/auth/data/models/register_request.dart';
import 'package:annonceflash_project/auth/data/models/user_model.dart';
import 'package:annonceflash_project/auth/data/repositories/auth_repository.dart';
import 'package:annonceflash_project/shared/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        final user = await repository.login(
          email: event.email,
          password: event.password,
        );
        emit(LoginSuccess(user: user));
      } catch (e) {
        emit(
          LoginFailure(
            message: Utils.extraErrorMessage(e),
          ),
        );
      }
    });

    on<SignUpEvent>(
      (event, emit) async {
        try {
          emit(SignUpLoading());
          final user = await repository.signUp(
            request: event.request,
          );
          emit(SignUpSuccess(user: user));
        } catch (e) {
          emit(
            SignUpFailure(
              message: Utils.extraErrorMessage(e),
            ),
          );
        }
      },
    );

    on<CheckAuthStateEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        var userId = prefs.getInt('user_id');

        if (userId != null) {
          var user = await repository.getUserById(id: userId);
          emit(CheckAuthStateSuccess(user: user));
          return;
        }

        emit(CheckAuthStateFailure());
      } catch (e) {
        emit(CheckAuthStateFailure());
      }
    });
  }
}
