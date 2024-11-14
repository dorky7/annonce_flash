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
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          // onTap: (value) {
          //   if (value == 3) {
          //     if (context.read<AuthBloc>().state.user == null) {
          //       context.router.push(const LoginRoute());
          //     } else {
          //       tabsRouter.setActiveIndex(value);
          //     }
          //   } else {
          //     tabsRouter.setActiveIndex(value);
          //   }
          // },
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
              label: 'Categories ',
              icon: Icon(
                Icons.category,
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.black,
              label: 'Profile',
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
