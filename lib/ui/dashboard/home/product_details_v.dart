import 'package:alphatwelve_task/core/di/injectable.dart';
import 'package:alphatwelve_task/core/resources/colors.dart';
import 'package:alphatwelve_task/core/resources/styles.dart';
import 'package:alphatwelve_task/features/cart/cubit/cart_cubit.dart';
import 'package:alphatwelve_task/gen/assets.gen.dart';
import 'package:alphatwelve_task/routes/route.gr.dart';
import 'package:alphatwelve_task/ui/dashboard/cubit/dashboard_cubit.dart';
import 'package:alphatwelve_task/ui/widgets/build_app_bar.dart';
import 'package:alphatwelve_task/ui/widgets/built_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsV extends StatelessWidget {
  const ProductDetailsV({super.key});

  @override
  Widget build(BuildContext context) {
    var screenH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Container(
            height: 94,
            color: ColorManager.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [BuildBtn(onPressed: () {
                  si<CartCubit>().addToCart(
                    si<DashboardCubit>().state.selectedProduct!,
                  );
                }, label: state.isAddButtonDisabled ? "Added to cart" : "Add to cart", textColor: state.isAddButtonDisabled ? ColorManager.icon : ColorManager.white, disabled: state.isAddButtonDisabled,)],
              ),
            ),
          );
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(
              title: "DELIVERY ADDRESS",
              address: "Umuezike Road, Oyo State",
              hasBack: true,
              onback: () {
                si<AppRouter>().pop();
              },
              backLabel: "Go back",
            ),
            Expanded(
              child: BlocBuilder<DashboardCubit, DashboardState>(
                builder: (context, state) {
                  return SizedBox(
                    child: ListView(
                      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              state.selectedProduct?.image ?? '',
                              height: screenH * 0.4,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15, right: 15),
                                child: GestureDetector(
                                  onTap: (){},
                                  child: CircleAvatar(
                                    radius: 22,
                                    backgroundColor: ColorManager.white,
                                    child: SvgPicture.asset(
                                      Assets.icons.favourite
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                        .animate()
                        .fadeIn(duration: 600.ms, curve: Curves.easeOut)
                        .scale(
                          begin: const Offset(0.8, 0.8),
                          duration: 600.ms,
                          curve: Curves.easeOut,
                        ),

                        SizedBox(height: 10),

                        Text(
                              state.selectedProduct?.title ?? "",
                              style: getRegularStyle(
                                fontSize: 17,
                                color: ColorManager.text,
                              ),
                            )
                            .animate()
                            .slideX(
                              begin: -0.3,
                              duration: 500.ms,
                              delay: 200.ms,
                              curve: Curves.easeOut,
                            )
                            .fadeIn(duration: 500.ms, delay: 200.ms),

                        SizedBox(height: 10),

                        Text(
                              "\$${state.selectedProduct?.price}",
                              style: getBoldStyle(
                                fontSize: 33,
                                color: ColorManager.text,
                              ),
                            )
                            .animate()
                            .scale(
                              begin: const Offset(0.5, 0.5),
                              duration: 600.ms,
                              delay: 300.ms,
                              curve: Curves.elasticOut,
                            )
                            .fadeIn(duration: 400.ms, delay: 300.ms),

                        SizedBox(height: 10),

                        Text(
                              "About this item",
                              style: getRegularStyle(
                                fontSize: 14,
                                color: ColorManager.gray4,
                              ),
                            )
                            .animate()
                            .slideY(
                              begin: 0.5,
                              duration: 400.ms,
                              delay: 500.ms,
                              curve: Curves.easeOut,
                            )
                            .fadeIn(duration: 400.ms, delay: 500.ms),

                        SizedBox(height: 10),

                        Column(
                          children: List.generate(
                            state.selectedProduct?.description.length ?? 0,
                            (index) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 7),
                                      child: Container(
                                            height: 5,
                                            width: 5,
                                            margin: EdgeInsets.only(right: 10),
                                            decoration: BoxDecoration(
                                              color: ColorManager.gray4,
                                              shape: BoxShape.circle,
                                            ),
                                          )
                                          .animate()
                                          .scale(
                                            begin: const Offset(0, 0),
                                            duration: 300.ms,
                                            delay: (600 + (index * 100)).ms,
                                          )
                                          .fadeIn(
                                            duration: 300.ms,
                                            delay: (600 + (index * 100)).ms,
                                          ),
                                    ),
                                    Expanded(
                                      child: Text(
                                            state
                                                    .selectedProduct
                                                    ?.description[index] ??
                                                "",
                                            style: getRegularStyle(
                                              fontSize: 14,
                                              color: ColorManager.gray4,
                                            ),
                                          )
                                          .animate()
                                          .slideX(
                                            begin: 0.3,
                                            duration: 400.ms,
                                            delay: (650 + (index * 100)).ms,
                                            curve: Curves.easeOut,
                                          )
                                          .fadeIn(
                                            duration: 400.ms,
                                            delay: (650 + (index * 100)).ms,
                                          ),
                                    ),
                                  ],
                                )
                                .animate()
                                .slideY(
                                  begin: 0.2,
                                  duration: 300.ms,
                                  delay: (600 + (index * 100)).ms,
                                  curve: Curves.easeOut,
                                )
                                .animate(
                                  onComplete: (controller) {
                                    controller.repeat(reverse: true);
                                  },
                                )
                                .shimmer(
                                  duration: 2000.ms,
                                  delay: (1000 + (index * 100)).ms,
                                  color: Colors.white.withOpacity(0.1),
                                ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
