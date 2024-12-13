import 'package:annonceflash_project/auth/business_logic/bloc/auth_bloc.dart';
import 'package:annonceflash_project/categories/business_logic/bloc/category_list_bloc.dart';
import 'package:annonceflash_project/shared/routes/app_router.dart';
import 'package:annonceflash_project/service_locator.dart';
import 'package:annonceflash_project/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'annonces/business_logic/announce_list/announce_list_bloc.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => getIt.get<AuthBloc>(),
        ),
        BlocProvider<AnnounceListBloc>(
          create: (_) => getIt.get<AnnounceListBloc>(),
        ),
        BlocProvider<CategoryListBloc>(
          create: (_) => getIt.get<CategoryListBloc>(),
        ),
      ],
      child: GlobalLoaderOverlay(
        useDefaultLoading: true,
        child: MaterialApp.router(
          title: 'Annonces Flash',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
            ),
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
          builder: (context, child) => _unFocusWrapper(child),
        ),
      ),
    );
  }
}

Widget _unFocusWrapper(Widget? child) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    child: child,
  );
}
