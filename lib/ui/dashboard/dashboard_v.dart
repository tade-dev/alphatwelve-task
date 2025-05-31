import 'package:alphatwelve_task/core/di/injectable.dart';
import 'package:alphatwelve_task/core/resources/colors.dart';
import 'package:alphatwelve_task/core/resources/styles.dart';
import 'package:alphatwelve_task/gen/assets.gen.dart';
import 'package:alphatwelve_task/ui/dashboard/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class DashboardV extends StatelessWidget {
  const DashboardV({super.key});

  @override
  Widget build(BuildContext context) {

    var dashboard = si<DashboardCubit>();

    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          body: state.views[state.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            enableFeedback: false,
            selectedLabelStyle: getMediumStyle(
              color: ColorManager.primary,
              fontSize: 12
            ),
            selectedItemColor: ColorManager.primary,
            unselectedItemColor: ColorManager.textAlt,
            unselectedLabelStyle: getMediumStyle(
              color: ColorManager.textAlt,
              fontSize: 12
            ),
            items: List.generate(
              state.views.length, 
              (index) {
                switch (index) {
                  case 0:
                    return BottomNavigationBarItem(
                      icon: SvgPicture.asset(Assets.icons.home),
                      activeIcon: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: SvgPicture.asset(
                          Assets.icons.home,
                          color: Colors.white,
                        ),
                      ),
                      label: 'Home',
                    );

                  case 1:
                    return BottomNavigationBarItem(
                      icon: SvgPicture.asset(Assets.icons.cart),
                      activeIcon: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: SvgPicture.asset(
                          Assets.icons.cart,
                          color: Colors.white,
                        ),
                      ),
                      label: 'Cart',
                    );

                  case 2:
                    return BottomNavigationBarItem(
                      icon: SvgPicture.asset(Assets.icons.favourite),
                      activeIcon: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: SvgPicture.asset(
                          Assets.icons.favourite,
                          color: Colors.white,
                        ),
                      ),
                      label: 'Favorites',
                    );

                  case 3:
                    return BottomNavigationBarItem(
                      icon: SvgPicture.asset(Assets.icons.user),
                      activeIcon: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: SvgPicture.asset(
                          Assets.icons.user,
                          color: Colors.white,
                        ),
                      ),
                      label: 'Profile',
                    );

                  default:
                    return BottomNavigationBarItem(
                      icon: Icon(Icons.help_outline),
                      label: 'Other',
                    );
                }
              }
            ),
            backgroundColor: Colors.white,
            currentIndex: state.currentIndex,
            onTap: (value) {
              dashboard.updateCurrentIndex(value);
            },
          ),
        );
      },
    );
  }
}
