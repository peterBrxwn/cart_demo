// Flutter imports:
import 'package:flutter/material.dart' hide Badge;

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import 'package:cart_demo/features/order/bloc/order_bloc.dart';
import 'package:cart_demo/routing/router.gr.dart';
import 'package:cart_demo/utils/app_theme.dart';

class TabPage extends StatelessWidget {
  const TabPage({Key? key}) : super(key: key);
  static const routeName = 'tab';

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [CategoryRoute(), OrderRoute()],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              activeIcon: Column(
                children: const [
                  Icon(FontAwesomeIcons.house),
                  SizedBox(height: 5),
                  Icon(Icons.circle, size: 7.5),
                ],
              ),
              icon: const Icon(FontAwesomeIcons.house),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  return Badge(
                    animationType: BadgeAnimationType.fade,
                    badgeColor: AppTheme.transparent,
                    position: BadgePosition.bottomEnd(bottom: -15, end: -15),
                    showBadge: state.orderCount > 0,
                    badgeContent: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        shape: BoxShape.rectangle,
                        color: AppTheme.black,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        state.orderCount.toString(),
                        style: const TextStyle(color: AppTheme.white),
                      ),
                    ),
                    child: const Icon(FontAwesomeIcons.store),
                  );
                },
              ),
              label: 'Order',
            ),
          ],
        );
      },
    );
  }
}
