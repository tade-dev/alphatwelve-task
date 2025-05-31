import 'package:alphatwelve_task/core/di/injectable.dart';
import 'package:alphatwelve_task/gen/fonts.gen.dart';
import 'package:alphatwelve_task/ui/components/product.dart';
import 'package:alphatwelve_task/ui/dashboard/cubit/dashboard_cubit.dart';
import 'package:alphatwelve_task/ui/widgets/build_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeV extends StatelessWidget {
  const HomeV({super.key});

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
              backLabel: "Technology"
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
                              "Smartphones, Laptops &\nAssecories",
                              style: TextStyle(
                                fontFamily: FontFamily.ibmmono,
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                              )
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        BlocBuilder<DashboardCubit, DashboardState>(
                          builder: (context, state) {
                            final products = state.filteredProducts;

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
                                return ProductV(
                                  title: product.title,
                                  image: product.image,
                                  price: product.price,
                                  ontap: () {
                                    si<DashboardCubit>().updateSelectedProduct(product);
                                  },
                                )
                                .animate(
                                  delay: Duration(milliseconds: index * 100),
                                )
                                .fadeIn(duration: 500.ms)
                                .scale(
                                  duration: 500.ms,
                                  curve: Curves.easeOutBack,
                                  begin: const Offset(0.95, 0.95),
                                  end: const Offset(1, 1),
                                );
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}