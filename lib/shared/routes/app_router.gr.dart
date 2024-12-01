// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:annonceflash_project/annonces/business_logic/announce_list/announce_list_bloc.dart'
    as _i11;
import 'package:annonceflash_project/application_screen.dart' as _i2;
import 'package:annonceflash_project/auth/presentation/pages/login_screen.dart'
    as _i5;
import 'package:annonceflash_project/auth/presentation/pages/register/register_screen.dart'
    as _i7;
import 'package:annonceflash_project/categories/presentation/pages/all_categories_screen.dart'
    as _i1;
import 'package:annonceflash_project/categories/presentation/pages/categories_screen.dart'
    as _i3;
import 'package:annonceflash_project/home_screen.dart' as _i4;
import 'package:annonceflash_project/profiles_screen.dart' as _i6;
import 'package:annonceflash_project/search_screen.dart' as _i8;
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

/// generated route for
/// [_i1.AllProducts]
class AllProducts extends _i9.PageRouteInfo<AllProductsArgs> {
  AllProducts({
    _i10.Key? key,
    required _i11.AnnounceListBloc bloc,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          AllProducts.name,
          args: AllProductsArgs(
            key: key,
            bloc: bloc,
          ),
          initialChildren: children,
        );

  static const String name = 'AllProducts';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AllProductsArgs>();
      return _i1.AllProducts(
        key: args.key,
        bloc: args.bloc,
      );
    },
  );
}

class AllProductsArgs {
  const AllProductsArgs({
    this.key,
    required this.bloc,
  });

  final _i10.Key? key;

  final _i11.AnnounceListBloc bloc;

  @override
  String toString() {
    return 'AllProductsArgs{key: $key, bloc: $bloc}';
  }
}

/// generated route for
/// [_i2.ApplicationScreen]
class ApplicationRoute extends _i9.PageRouteInfo<void> {
  const ApplicationRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ApplicationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApplicationRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.ApplicationScreen();
    },
  );
}

/// generated route for
/// [_i3.CategoriesScreen]
class CategoriesRoute extends _i9.PageRouteInfo<void> {
  const CategoriesRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.CategoriesScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i9.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i10.Key? key,
    required dynamic Function()? onTap,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onTap: onTap,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return _i5.LoginScreen(
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

  final _i10.Key? key;

  final dynamic Function()? onTap;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onTap: $onTap}';
  }
}

/// generated route for
/// [_i6.ProfileScreen]
class ProfileRoute extends _i9.PageRouteInfo<void> {
  const ProfileRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i7.RegisterScreen]
class RegisterRoute extends _i9.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i10.Key? key,
    required dynamic Function()? onTap,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(
            key: key,
            onTap: onTap,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterRouteArgs>();
      return _i7.RegisterScreen(
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

  final _i10.Key? key;

  final dynamic Function()? onTap;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, onTap: $onTap}';
  }
}

/// generated route for
/// [_i8.SearchScreen]
class SearchRoute extends _i9.PageRouteInfo<void> {
  const SearchRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.SearchScreen();
    },
  );
}
