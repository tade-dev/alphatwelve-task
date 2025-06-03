import 'package:alphatwelve_task/core/di/injectable.dart';
import 'package:alphatwelve_task/features/favorites/cubit/favorites_cubit.dart';
import 'package:alphatwelve_task/gen/fonts.gen.dart';
import 'package:alphatwelve_task/routes/route.gr.dart';
import 'package:alphatwelve_task/ui/components/product.dart';
import 'package:alphatwelve_task/ui/dashboard/cubit/dashboard_cubit.dart';
import 'package:alphatwelve_task/ui/widgets/build_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesV extends StatelessWidget {
  const FavoritesV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(
              title: "DELIVERY ADDRESS", 
              address: "Umuezike Road, Oyo State",
              searchable: true,
              hasBack: true,
              onback: (){},
              backLabel: "Favorites",
              onChanged: (p0) {
                si<FavoritesCubit>().searchTextChanged(p0);
              },
            ),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Favorite Products",
                              style: TextStyle(
                                fontFamily: FontFamily.ibmmono,
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                              )
                            ),
                          ],
                        )
                        .animate()
                        .slideX(
                          begin: -0.5,
                          duration: 700.ms,
                          curve: Curves.easeOutCubic,
                        )
                        .fadeIn(
                          duration: 600.ms,
                          curve: Curves.easeOut,
                        ),
                        
                        SizedBox(height: 20),
                        
                        BlocBuilder<FavoritesCubit, FavoritesState>(
                          builder: (context, state) {
                            final products = state.filteredFavorites;

                            return GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: products.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 260,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                              ),
                              itemBuilder: (context, index) {
                                final product = products[index];
                                final isEvenRow = (index ~/ 2) % 2 == 0;
                                final isLeftColumn = index % 2 == 0;
                                
                                return ProductV(
                                  title: product.title,
                                  image: product.image,
                                  price: product.price,
                                  ontap: () {
                                    si<DashboardCubit>().updateSelectedProduct(product);
                                    si<AppRouter>().push(ProductDetailsV());
                                  },
                                )
                                .animate(
                                  delay: Duration(milliseconds: 200 + (index * 150)),
                                )
                                .slideX(
                                  begin: isLeftColumn ? -0.8 : 0.8,
                                  duration: 600.ms,
                                  curve: Curves.easeOutCubic,
                                )
                                .fadeIn(
                                  duration: 500.ms,
                                  curve: Curves.easeOut,
                                )
                                .scale(
                                  duration: 700.ms,
                                  curve: Curves.elasticOut,
                                  begin: const Offset(0.7, 0.7),
                                  end: const Offset(1, 1),
                                )
                                .rotate(
                                  begin: isEvenRow ? -0.02 : 0.02,
                                  end: 0,
                                  duration: 800.ms,
                                  curve: Curves.easeOutBack,
                                )
                                .animate(
                                  onComplete: (controller) => controller.repeat(reverse: true),
                                )
                                .shimmer(
                                  duration: 2500.ms,
                                  delay: Duration(milliseconds: 1000 + (index * 200)),
                                  color: Colors.white.withOpacity(0.08),
                                  angle: 45,
                                )
                                .animate(
                                  target: 0,
                                )
                                .scaleXY(
                                  begin: 1,
                                  end: 1.05,
                                  duration: 150.ms,
                                  curve: Curves.easeInOut,
                                );
                              },
                            );
                          },
                        )
                        .animate(
                          delay: 100.ms,
                        )
                        .fadeIn(
                          duration: 800.ms,
                          curve: Curves.easeOut,
                        )
                        .slideY(
                          begin: 0.3,
                          duration: 700.ms,
                          curve: Curves.easeOutCubic,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}