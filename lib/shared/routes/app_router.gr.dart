// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:annonceflash_project/application_screen.dart' as _i1;
import 'package:annonceflash_project/categories_screen.dart' as _i2;
import 'package:annonceflash_project/home_screen.dart' as _i3;
import 'package:annonceflash_project/profiles_screen.dart' as _i4;
import 'package:annonceflash_project/search_screen.dart' as _i5;
import 'package:auto_route/auto_route.dart' as _i6;

/// generated route for
/// [_i1.ApplicationScreen]
class ApplicationRoute extends _i6.PageRouteInfo<void> {
  const ApplicationRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ApplicationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApplicationRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.ApplicationScreen();
    },
  );
}

/// generated route for
/// [_i2.CategoriesScreen]
class CategoriesRoute extends _i6.PageRouteInfo<void> {
  const CategoriesRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.CategoriesScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.ProfilesScreen]
class ProfilesRoute extends _i6.PageRouteInfo<void> {
  const ProfilesRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ProfilesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilesRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.ProfilesScreen();
    },
  );
}

/// generated route for
/// [_i5.SearchScreen]
class SearchRoute extends _i6.PageRouteInfo<void> {
  const SearchRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SearchScreen();
    },
  );
}
