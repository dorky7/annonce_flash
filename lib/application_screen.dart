import 'package:annonceflash_project/auth/presentation/pages/login_screen.dart';
import 'package:annonceflash_project/shared/routes/app_router.gr.dart';
import 'package:annonceflash_project/shared/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        SearchRoute(),
        CategoriesRoute(),
        LoginScsreen(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: AppColors.black,
              label: 'Home',
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.black,
              label: 'Search',
              icon: Icon(
                Icons.search,
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.black,
              label: 'Categories',
              icon: Icon(
                Icons.category,
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.black,
              label: 'login',
              icon: Icon(
                Icons.person,
              ),
            ),
          ],
        );
      },
    );
  }
}
