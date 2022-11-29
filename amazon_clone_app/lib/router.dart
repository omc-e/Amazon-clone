import 'package:amazon_clone_app/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_app/features/admin/screens/add_product_scree.dart';
import 'package:amazon_clone_app/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_app/features/home/screens/category_deals_screen.dart';
import 'package:amazon_clone_app/features/home/screens/home_screen.dart';

import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const BottomBar(),
      );
    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddProductScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
