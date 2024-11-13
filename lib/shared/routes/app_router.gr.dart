// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:annonceflash_project/application_screen.dart' as _i1;
import 'package:annonceflash_project/auth/presentation/pages/login_screen.dart'
    as _i4;
import 'package:annonceflash_project/auth/presentation/pages/register/register_screen.dart'
    as _i6;
import 'package:annonceflash_project/categories/business_logic/bloc/category_list_bloc.dart'
    as _i10;
import 'package:annonceflash_project/categories_screen.dart' as _i2;
import 'package:annonceflash_project/home_screen.dart' as _i3;
import 'package:annonceflash_project/profiles_screen.dart' as _i5;
import 'package:annonceflash_project/search_screen.dart' as _i7;
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

/// generated route for
/// [_i1.ApplicationScreen]
class ApplicationRoute extends _i8.PageRouteInfo<void> {
  const ApplicationRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ApplicationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApplicationRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.ApplicationScreen();
    },
  );
}

/// generated route for
/// [_i2.CategoriesScreen]
class CategoriesRoute extends _i8.PageRouteInfo<CategoriesRouteArgs> {
  CategoriesRoute({
    _i9.Key? key,
    required _i10.CategoryListBloc bloc,
    required String title,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          CategoriesRoute.name,
          args: CategoriesRouteArgs(
            key: key,
            bloc: bloc,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategoriesRouteArgs>();
      return _i2.CategoriesScreen(
        key: args.key,
        bloc: args.bloc,
        title: args.title,
      );
    },
  );
}

class CategoriesRouteArgs {
  const CategoriesRouteArgs({
    this.key,
    required this.bloc,
    required this.title,
  });

  final _i9.Key? key;

  final _i10.CategoryListBloc bloc;

  final String title;

  @override
  String toString() {
    return 'CategoriesRouteArgs{key: $key, bloc: $bloc, title: $title}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i8.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i9.Key? key,
    required dynamic Function()? onTap,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onTap: onTap,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return _i4.LoginScreen(
        key: args.key,
        onTap: args.onTap,
      );
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.onTap,
  });

  final _i9.Key? key;

  final dynamic Function()? onTap;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onTap: $onTap}';
  }
}

/// generated route for
/// [_i5.ProfileScreen]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i6.RegisterScreen]
class RegisterRoute extends _i8.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i9.Key? key,
    required dynamic Function()? onTap,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(
            key: key,
            onTap: onTap,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterRouteArgs>();
      return _i6.RegisterScreen(
        key: args.key,
        onTap: args.onTap,
      );
    },
  );
}

class RegisterRouteArgs {
  const RegisterRouteArgs({
    this.key,
    required this.onTap,
  });

  final _i9.Key? key;

  final dynamic Function()? onTap;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, onTap: $onTap}';
  }
}

/// generated route for
/// [_i7.SearchScreen]
class SearchRoute extends _i8.PageRouteInfo<void> {
  const SearchRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.SearchScreen();
    },
  );
}
