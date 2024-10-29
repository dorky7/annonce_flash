import 'package:annonceflash_project/shared/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: ApplicationRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: '',
            ),
            AutoRoute(
              page: SearchRoute.page,
              path: 'search',
            ),
            AutoRoute(
              page: CategoriesRoute.page,
              path: 'categories',
            ),
            AutoRoute(
              page: ProfilesRoute.page,
              path: 'profile',
            )
          ],
        )
      ];
}
