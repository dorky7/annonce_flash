// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:annonceflash_project/annonces/business_logic/announce_list/announce_list_bloc.dart'
    as _i12;
import 'package:annonceflash_project/annonces/data/models/announce_query_filter.dart'
    as _i13;
import 'package:annonceflash_project/annonces/presentation/pages/announce_list_screen.dart'
    as _i2;
import 'package:annonceflash_project/application_screen.dart' as _i3;
import 'package:annonceflash_project/auth/presentation/pages/login_screen.dart'
    as _i6;
import 'package:annonceflash_project/auth/presentation/pages/register/register_screen.dart'
    as _i8;
import 'package:annonceflash_project/categories/presentation/pages/all_categories_screen.dart'
    as _i1;
import 'package:annonceflash_project/categories/presentation/pages/categories_screen.dart'
    as _i4;
import 'package:annonceflash_project/home_screen.dart' as _i5;
import 'package:annonceflash_project/profiles_screen.dart' as _i7;
import 'package:annonceflash_project/search_screen.dart' as _i9;
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/cupertino.dart' as _i14;
import 'package:flutter/material.dart' as _i11;

/// generated route for
/// [_i1.AllProducts]
class AllProducts extends _i10.PageRouteInfo<AllProductsArgs> {
  AllProducts({
    _i11.Key? key,
    required _i12.AnnounceListBloc bloc,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          AllProducts.name,
          args: AllProductsArgs(
            key: key,
            bloc: bloc,
          ),
          initialChildren: children,
        );

  static const String name = 'AllProducts';

  static _i10.PageInfo page = _i10.PageInfo(
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

  final _i11.Key? key;

  final _i12.AnnounceListBloc bloc;

  @override
  String toString() {
    return 'AllProductsArgs{key: $key, bloc: $bloc}';
  }
}

/// generated route for
/// [_i2.AnnounceListScreen]
class AnnounceListRoute extends _i10.PageRouteInfo<AnnounceListRouteArgs> {
  AnnounceListRoute({
    required _i13.AnnounceQueryFilter filter,
    required String title,
    _i14.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          AnnounceListRoute.name,
          args: AnnounceListRouteArgs(
            filter: filter,
            title: title,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AnnounceListRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AnnounceListRouteArgs>();
      return _i2.AnnounceListScreen(
        filter: args.filter,
        title: args.title,
        key: args.key,
      );
    },
  );
}

class AnnounceListRouteArgs {
  const AnnounceListRouteArgs({
    required this.filter,
    required this.title,
    this.key,
  });

  final _i13.AnnounceQueryFilter filter;

  final String title;

  final _i14.Key? key;

  @override
  String toString() {
    return 'AnnounceListRouteArgs{filter: $filter, title: $title, key: $key}';
  }
}

/// generated route for
/// [_i3.ApplicationScreen]
class ApplicationRoute extends _i10.PageRouteInfo<void> {
  const ApplicationRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ApplicationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApplicationRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.ApplicationScreen();
    },
  );
}

/// generated route for
/// [_i4.CategoriesScreen]
class CategoriesRoute extends _i10.PageRouteInfo<void> {
  const CategoriesRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i4.CategoriesScreen();
    },
  );
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeScreen();
    },
  );
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoginScreen();
    },
  );
}

/// generated route for
/// [_i7.ProfileScreen]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i8.RegisterScreen]
class RegisterRoute extends _i10.PageRouteInfo<void> {
  const RegisterRoute({List<_i10.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i9.SearchScreen]
class SearchRoute extends _i10.PageRouteInfo<void> {
  const SearchRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i9.SearchScreen();
    },
  );
}
